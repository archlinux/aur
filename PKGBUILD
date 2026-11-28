# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>

pkgname=lightdm-settings
pkgver=2.1.3
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
sha256sums=('bb88ab679021d57603d649a68ffc590f433b0978a885cdeac681ce47fe57532a')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    cp -r usr "$pkgdir"
}
