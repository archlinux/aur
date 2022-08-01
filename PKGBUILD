# Maintainer: Zdenek Janak <zdenek@astronomie.cz>

pkgname=fitspng
pkgver=2.0
pkgrel=1
pkgdesc="FITS to PNG convertor"
arch=('i686' 'x86_64')
url="http://integral.physics.muni.cz/fitspng/"
license=('GPL3')
depends=('libpng' 'cfitsio')
source=(ftp://integral.physics.muni.cz/pub/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('a2109c37ab85f6d15126c5f5cb4727e95f61db38c94f56849c03c872813d133a')

build() {
  cd "$pkgname"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
}
