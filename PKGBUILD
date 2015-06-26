# Maintainer: Sam Burgos <jsbm1089 at gmail dot com>

pkgname=blueberry
pkgver=1.0.8
pkgrel=1
pkgdesc="A Bluetooth configuration tool"
arch=('any')
url="https://github.com/linuxmint/blueberry"
license=('GPL')
depends=('python2' 'python2-gobject' 'gtk3' 'gnome-bluetooth>=3.14' 'wmctrl' 'rfkill')
conflicts=(cinnamon-bluetooth)
replaces=(cinnamon-bluetooth)
install="${pkgname}.install"
source=("https://github.com/linuxmint/blueberry/archive/${pkgver}.tar.gz")
md5sums=('f9b3a587d5e51c4c80f72b4780218077')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    cp -fr etc ${pkgdir}/
    cp -fr usr ${pkgdir}/
}
