# Maintainer: Jan Peter Koenig <public@janpeterkoenig.com>
# Maintainer: Mark King <mark.king@markzz.com>
# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
pkgname=libtrace
pkgver=4.0.21
pkgrel=1
pkgdesc="a library for trace processing supporting multiple input and output methods"
arch=('x86_64')
url="http://research.wand.net.nz/software/libtrace.php"
license=('GPL3')
depends=('libwandio>=4.2' 'libpcap' 'zlib')
makedepends=('automake' 'flex' 'bison')
source=("https://github.com/LibtraceTeam/libtrace/archive/refs/tags/$pkgver-1.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver-1"
  ./bootstrap.sh
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver-1"

  make DESTDIR="$pkgdir/" install
}

sha256sums=('9e53d4587d0f2ec12db9666ef7c090f24c0ee01d853b839da4584b8a400d80b5')
