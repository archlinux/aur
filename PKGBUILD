# Maintainer: Ashwini Sahu <ashwinisahu990@gmail.com>

pkgname=arcolinux-betterlockscreen
pkgver=21.08.03
_pkgver=21.08-03
pkgrel=1
pkgdesc="ArcoLinux-betterlockscreen"
arch=('any')
url="https://github.com/arcolinux/${pkgname}"
license=('GPL3')
depends=('python3' 'python-gobject' 'python-psutil' 'betterlockscreen')
makedepends=('tar')
provides=('template')
source=("arcolinux-betterlockscreen-${_pkgver}.tar.gz::https://github.com/arcolinux/arcolinux-betterlockscreen/archive/refs/tags/${_pkgver}.tar.gz")
md5sums=('71ac732ad37c26f83ed2a0ef42eeb020')

package() {
	cd "$srcdir/arcolinux-betterlockscreen-${_pkgver}/usr"
    install -Dm775 local/bin/arcolinux-betterlockscreen      -T ${pkgdir}/usr/local/bin/arcolinux-betterlockscreen
    install -Dm644 share/applications/arcolinux-betterlockscreen.desktop -T ${pkgdir}/usr/share/applications/arcolinux-betterlockscreen.desktop
    install -Dm644 share/arcolinux-betterlockscreen/*.py -t ${pkgdir}/usr/share/arcolinux-betterlockscreen
    install -Dm644 share/arcolinux-betterlockscreen/images/* -t ${pkgdir}/usr/share/arcolinux-betterlockscreen/images
}
