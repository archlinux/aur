# Maintainer: Sam Burgos < santiago dot burgos1089 at gmail dot com >

pkgname=lightdm-settings
pkgver=1.2.7
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
sha256sums=('a3037b48c0e5b582d334ad449c225d77f833ec4b955af85babc849e1e512e699')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  cp -r usr $pkgdir
}
