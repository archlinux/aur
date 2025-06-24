# Maintainer: Mike Pento <mjpento@gmail.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=wmmixer
pkgver=1.9
pkgrel=1
epoch=1
pkgdesc="A mixer application written for the WindowMaker dock."
arch=('i686' 'x86_64')
url="http://www.dockapps.net/wmmixer"
license=('GPL')
depends=('libxpm')
options+=('!debug')
source=("http://www.dockapps.net/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('7de0299a12fea1c25dda222acbc9a624')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="$pkgdir" install
}
