# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=rectify-jpg
pkgver=0.3
pkgrel=1
pkgdesc="rectify_jpg is a command-line tool that rectifies (corrects geometric distortion) of Meteor-M weather images" 
arch=(any)
url="http://www.5b4az.org" 
license=('GPL') 
depends=('libjpeg') 
makedepends=('gcc')
source=("http://www.5b4az.org/pkg/lrpt/${pkgname}-${pkgver}.tar.bz2")
sha1sums=('4672ffb03384cd93db189888fc719249479f65fe')

prepare() {
  cd ${pkgname%jpg}jpeg-${pkgver}

  rm rectify-jpg
}

build() {
  cd ${pkgname%jpg}jpeg-${pkgver}

  gcc rectify-jpg.c -lm -ljpeg -o rectify-jpg
}

package() {
  cd ${pkgname%jpg}jpeg-${pkgver}

  install -Dm755 rectify-jpg "${pkgdir}/usr/bin/rectify-jpg"
}
