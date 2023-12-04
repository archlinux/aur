# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=lightdm-settings
pkgver=2.0.1
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
sha256sums=('a44b62c18e64b7b9bbcc98e623c13b0ac94898974645e47d7afd272e98e0ae17')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  cp -r usr "$pkgdir"
}
