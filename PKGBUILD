# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=hashdb
pkgver=3.0.0
_pkgver=3.0.0
pkgrel=1
pkgdesc='Tool for finding previously identified blocks of data in media such as disk images'
arch=('i686' 'x86_64')
url='https://github.com/NPS-DEEP/hashdb/wiki'
license=('GPL')
depends=(openssl bzip2 libewf) 
makedepends=()
source=(http://digitalcorpora.org/downloads/hashdb/hashdb-$_pkgver.tar.gz)
sha256sums=('ad013feabdc437deca2a7a10349f5ebf08ee47d699ad0d4ae141fd8dc7542206')

build(){
  cd "$srcdir"/$pkgname-$_pkgver
  ./configure --prefix=/usr --enable-dependency-tracking --enable-mcheck --enable-address-sanitizer
  make
}
package(){
  cd "$srcdir"/$pkgname-$_pkgver
  make DESTDIR="$pkgdir/" install
}
