# Maintainer: Jo De Boeck <deboeck.jo@gmail.com>
# Original Maintainer: Julien Humbert <julroy67@gmail.com>
# Contributor: danyf90
# Contributor: hermes14
pkgname=superbeam
pkgver=1.2.0
pkgrel=2
pkgdesc="The easiest and fastest way to share files with Android"
arch=('any')
url="http://superbe.am/"
license=('custom')
depends=('java-environment' 'bash')
makedepends=('gendesk')
source=(http://superbe.am/pc/linux/superbeam-linux.tar.gz)
md5sums=('87178e8ae2807b8ec411928e46f7b30d')

prepare(){
	gendesk -n -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name="SuperBeam" --categories="Network"
}

package() {
	mkdir -p "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/start-superbeam.sh" "$pkgdir/usr/bin/superbeam"
	install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
