# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=hashdb
pkgver=3.0.0_alpha_2
_pkgver=3.0.0-alpha-2
pkgrel=1
pkgdesc='Tool for finding previously identified blocks of data in media such as disk images'
arch=('i686' 'x86_64')
url='https://github.com/NPS-DEEP/hashdb/wiki'
license=('GPL')
depends=(openssl)
makedepends=()
source=(http://digitalcorpora.org/downloads/hashdb/hashdb-$_pkgver.tar.gz)
sha256sums=('f1c074a97efdba4a13aa124e69c271833baf5e1f69f6ce86fd768f40d8148f59')

build(){
  cd "$srcdir"/$pkgname-$_pkgver
  ./configure --prefix=/usr --enable-dependency-tracking --enable-mcheck --enable-address-sanitizer
  make
}
package(){
  cd "$srcdir"/$pkgname-$_pkgver
  make DESTDIR="$pkgdir/" install
}
