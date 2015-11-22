# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public@gmail.com>

pkgname=hashdb
pkgver=2.0.1
pkgrel=1
pkgdesc='Tool for finding previously identified blocks of data in media such as disk images'
arch=('i686' 'x86_64')
url='https://github.com/NPS-DEEP/hashdb/wiki'
license=('GPL')
depends=(libxml2 gcc-libs openssl)
makedepends=()
source=(http://digitalcorpora.org/downloads/hashdb/hashdb-$pkgver.tar.gz)
sha256sums=('de7d23a1f3c37297118d7d77d13290eb16f5127f2a13b01b332c40119886bca4')

build(){
  cd "$srcdir"/$pkgname-$pkgver

  ./configure --prefix=/usr --enable-dependency-tracking --enable-mcheck --enable-address-sanitizer
  make
}
package(){
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR="$pkgdir/" install
}
