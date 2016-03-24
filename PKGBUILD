# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=f-engrave
pkgver=1.57
pkgrel=1
pkgdesc="Supports Engraving and V-Carving"
url="http://www.scorchworks.com/Fengrave/fengrave.html"
arch=('i686' 'x86_64')
license=('GPLv3')
makedepends=('dos2unix')
depends=('python')
optdepends=('ttf2cxf: for reading True Type Fonts')
source=(http://www.scorchworks.com/Fengrave/F-Engrave-${pkgver}_src.zip arch.patch)
md5sums=('43b968be47690494e00bb2e1669553e1'
         '7db385c158cfdf726522a1c5c34aeb9d')

prepare() {
  cd F-Engrave-${pkgver}_src
  patch < ../arch.patch
  dos2unix ${pkgname}-${pkgver/./}.py
}

package() {
  cd F-Engrave-${pkgver}_src
  install -Dm755 ${pkgname}-${pkgver/./}.py "$pkgdir/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
