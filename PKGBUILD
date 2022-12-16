# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>

pkgname=lightdm-settings
pkgver=1.6.1
pkgrel=1
pkgdesc='A configuration tool for the LightDM display manager'
arch=('any')
url="https://github.com/linuxmint/${pkgname}"
#url="http://packages.linuxmint.com/pool/main/l/${pkgname}"
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
    lightdm-slick-greeter
    desktop-file-utils
    gettext
)
optdepends=('lightdm-guest: Enable guest session options')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/${pkgver}.tar.gz")
#source=("${pkgname}-${pkgver}.tar.xz::${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('6e7f112fe1648d25cc027731668137202d2c299e0ee9e2ad359ed37d0a9f39ed')

## Packaging via Github
build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  cp -r usr $pkgdir
}

## Packaging via Linuxmint repository
#build() {
#  cd ${pkgname}
#  make
#}

#package() {
#  cd ${pkgname}
#  cp -r usr "$pkgdir"
#}
