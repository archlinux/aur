# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>

pkgname=lightdm-settings
pkgver=2.0.8
pkgrel=1
pkgdesc="A configuration tool for the LightDM display manager "
arch=('any')
url="https://github.com/linuxmint/${pkgname}"
license=('GPL3')
depends=(
    'hicolor-icon-theme'
    'lightdm-slick-greeter'
    'polkit'
    'python-gobject'
    'python-setproctitle'
    'python-xapp'
)
optdepends=(
    'lightdm-guest: Enable guest session options'
)
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/${pkgver}.tar.gz")
sha256sums=('67ba99f37c844c71629eebe45ac3a4237aa34e25dcce11ca1646028c8acbb5a0')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    cp -r usr "$pkgdir"
}
