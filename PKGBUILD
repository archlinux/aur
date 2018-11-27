# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname=lightdm-settings
pkgver=1.2.4
pkgrel=1
pkgdesc="A configuration tool for the LightDM display manager"
arch=('any')
url="https://github.com/linuxmint/${pkgname}"
license=('GPL3')
depends=('hicolor-icon-theme'
    'lightdm-slick-greeter'
    'polkit'
    'python-gobject'
    'python-setproctitle'
    'python-xapp')
makedepends=('desktop-file-utils' 
    'gettext')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/${pkgver}.tar.gz")
sha256sums=('7006c9d2a69294e6ed1278e2a060d6d5038ff146a5947391af989bcd9739ed5d')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  cp -r usr $pkgdir
}
