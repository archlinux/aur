# Maintainer: Santiago Burgos <santiago.burgos1089@gmail.com>

pkgname=lightdm-settings
pkgver=2.0.6
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
sha256sums=('06a3dbd7840d4a64342aadc8ad73567ff89002138dec0e6f642787368671b206')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    cp -r usr "$pkgdir"
}
