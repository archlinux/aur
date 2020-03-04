# Maintainer: Jan Peter Koenig <public@janpeterkoenig.com>
# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
pkgname=libtrace
pkgver=4.0.11
pkgrel=1
pkgdesc="a library for trace processing supporting multiple input and output methods"
arch=('x86_64')
url="http://research.wand.net.nz/software/libtrace.php"
license=('GPL3')
depends=('libwandio>=4.2' 'libpcap' 'zlib')
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

sha256sums=('75a2a8bc1c3cb32a6a5e1ef41d5e3740505880d94cc97df94cf33f7a8f65750e')
