# Maintainer: Sam Burgos < santiago dot burgos1089 at gmail dot com >

pkgname=lightdm-settings
pkgver=1.2.6
pkgrel=1
pkgdesc='A configuration tool for the LightDM display manager'
arch=('any')
url="https://github.com/linuxmint/${pkgname}"
license=(GPL3)
depends=(
    hicolor-icon-theme
    lightdm-slick-greeter
    polkit
    python-gobject
    python-setproctitle
    python-xapp
)
makedepends=(
    desktop-file-utils
    gettext
)
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/${pkgver}.tar.gz")
sha256sums=('26b5e116d5453c62c6a8fd720a7d184f3f3f0eb82628ecca739d99bc77195a53')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  cp -r usr $pkgdir
}
