# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
pkgname=libtrace
pkgver=3.0.22
pkgrel=1
pkgdesc="libtrace is a library for trace processing"
arch=(i686 x86_64)
url="http://research.wand.net.nz/software/libtrace.php"
license=('GPL')
depends=(libpcap zlib)
makedepends=(automake flex bison)
source=(http://research.wand.net.nz/software/libtrace/$pkgname-$pkgver.tar.bz2)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

md5sums=('5acea7067e0e72a21059e6e055c06f5b')
