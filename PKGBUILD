# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public@gmail.com>

pkgname=bulk_extractor
pkgver=1.5.5
pkgrel=1
pkgdesc='A computer forensics tool that scans a disk image, a file, or a directory of files and extracts useful information'
arch=('i686' 'x86_64')
url='http://www.forensicswiki.org/wiki/Bulk_extractor'
license=('GPL')
depends=(libewf sqlite java-environment openssl gcc-libs expat bash)
makedepends=(hashdb)
source=(http://digitalcorpora.org/downloads/bulk_extractor/$pkgname-$pkgver.tar.gz)
sha256sums=('297a57808c12b81b8e0d82222cf57245ad988804ab467eb0a70cf8669594e8ed')

build(){
  cd "$srcdir"/$pkgname-$pkgver

  ./configure --prefix=/usr --enable-dependency-tracking --enable-mcheck
  make
}
package(){
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR="$pkgdir/" install
}
