# Maintainer: Jan Peter Koenig <public@janpeterkoenig.com>
# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
pkgname=libtrace
pkgver=4.0.6
pkgrel=1
pkgdesc="libtrace is a library for trace processing"
arch=('x86_64')
url="http://research.wand.net.nz/software/libtrace.php"
license=('GPL3')
depends=('libwandio' 'libpcap' 'zlib')
makedepends=('automake' 'flex' 'bison')
source=("http://research.wand.net.nz/software/libtrace/$pkgname-$pkgver.tar.bz2")

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

sha256sums=('253221d60db9b17057bb4f1ba506b25dfefcf74b813c7814ba76d62723885e93')
