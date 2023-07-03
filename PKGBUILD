pkgname=arcolinux-betterlockscreen
pkgver=24
_pkgver=23.06-01
pkgrel=1
pkgdesc="ArcoLinux-betterlockscreen"
arch=('any')
url="https://github.com/arcolinux/${pkgname}"
license=('GPL3')
depends=('python3' 'python-gobject' 'python-psutil' 'betterlockscreen')
makedepends=('tar')
provides=('template')
source=("arcolinux-betterlockscreen-${_pkgver}.tar.gz::https://github.com/arcolinux/arcolinux-betterlockscreen/archive/refs/tags/${_pkgver}.tar.gz")
md5sums=('7a6d775143cde6e837ab64d5c3193331')

package() {
	cd "$srcdir/arcolinux-betterlockscreen-${_pkgver}/usr"
    install -Dm775 local/bin/arcolinux-betterlockscreen      -T ${pkgdir}/usr/local/bin/arcolinux-betterlockscreen
    install -Dm644 share/applications/arcolinux-betterlockscreen.desktop -T ${pkgdir}/usr/share/applications/arcolinux-betterlockscreen.desktop
    install -Dm644 share/arcolinux-betterlockscreen/*.py -t ${pkgdir}/usr/share/arcolinux-betterlockscreen
    install -Dm644 share/arcolinux-betterlockscreen/images/* -t ${pkgdir}/usr/share/arcolinux-betterlockscreen/images
}
