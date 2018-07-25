# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname=lightdm-settings
pkgver=1.2.3
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
sha256sums=('4feecb2fb213bc1a5fe910907bff338cada4bb550d647d7eabd3d6c647d5be00')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  cp -r usr $pkgdir
}
