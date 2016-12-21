# Maintainer: Marco Feltmann <coding@marcofeltmann.de>

pkgname=m3d-print
pkgrel=1
pkgver=1.5.0.70
pkgdesc="Print 3D objects on your M3D Micro"
url="http://www.printm3d.com/"
provides=('m3d-print')
arch=('x86_64')
license=('custom')
depends=('mono')
makedepends=()
backup=()
install=''
source=(
    "https://printm3d.com/files/software/linux/M3D-Linux-${pkgver}.tar.gz"
    "https://printm3d.com/files/software/linux/README-${pkgver}.pdf"
)
md5sums=(
	'b0b9537726ed30b00e167a1350ba6566'
	'9ae06dff9bb2865841f9d5cac39fddc2'
)

package() {
    install -d "$pkgdir"/opt
    cp -R "$srcdir"/M3D.App "$pkgdir"/opt/M3D.App
    cp -R "$srcdir/README-$pkgver.pdf" "$pkgdir"/opt/M3D.App/README.pdf

    install -d "$pkgdir"/usr/bin
    echo "#!/bin/sh\nmono /opt/M3D.App/M3DGUI 2>&1 1>/dev/null &" > "$pkgdir"/usr/bin/m3d-print
    chmod 755 "$pkgdir"/usr/bin/m3d-print

    echo "If this is your first installation of the app or the M3D on this computer please refer to the readme at /opt/M3D.App/README.pdf for system setup instructions."
}
