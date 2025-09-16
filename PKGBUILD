# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>

pkgname=lightdm-settings
pkgver=2.0.9
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
sha256sums=('5084fa97ae26344534d30f95b832ff36cbf5f2762ba79efaaa0e55d085351c22')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    cp -r usr "$pkgdir"
}
