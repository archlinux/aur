# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=orgadoc
pkgver=1.3
pkgrel=1
pkgdesc="easily copy and maintain a pool of documents between computers"
arch=(i686 x86_64)
url='https://www.gnu.org/software/orgadoc/'
license=('GPL3')
depends=('bash' 'glibc' 'icu' 'libxml2' 'xz' 'zlib')
makedepends=('texi2html')
source=(https://ftp.gnu.org/gnu/orgadoc/$pkgname-$pkgver.tar.gz)
md5sums=('12de176434431b6af8cf4fac034135d1')

build(){
cd "$pkgname-$pkgver"
./configure --prefix=/usr
make
}
package(){
cd "$pkgname-$pkgver"
make DESTDIR="$pkgdir/" install
}
