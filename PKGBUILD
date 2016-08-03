# Maintainer: Stunts <f.pinamartins@gmail.com>
pkgname=staden-io_lib
_pkgname=io_lib
pkgver=1.14.6
pkgrel=1
pkgdesc="DNA sequence assembly (Gap4) and editing and analysis tools (Spin)"
arch=('i686' 'x86_64')
url="http://staden.sourceforge.net/"
license=('BSD')
depends=('curl')
source=(http://downloads.sourceforge.net/staden/$_pkgname-$pkgver.tar.gz)
md5sums=('8411e5993b0863166e449bc908327b6a')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr
  make CFLAGS=-g 
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
