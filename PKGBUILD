# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
pkgname=swbis
pkgver=1.13.3
pkgrel=1
pkgdesc="software packaging -- again"
arch=(i686 x86_64)
url='https://www.gnu.org/software/swbis/'
license=('GPL3')
depends=(bash gawk gcc-libs glibc)
optdepends=(inetutils)
source=(https://ftp.gnu.org/gnu/swbis/$pkgname-$pkgver.tar.gz)
md5sums=('0106914abde67de1c44cf67d2a1be557')

build(){
cd "$pkgname-$pkgver"
./configure --prefix=/usr --libexecdir=/usr/lib 
make -j1
}
package(){
cd "$pkgname-$pkgver"
make DESTDIR="$pkgdir/" install
}
