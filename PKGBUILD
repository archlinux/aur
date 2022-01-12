# Maintainer: Jan Peter Koenig <public@janpeterkoenig.com>
# Maintainer: Mark King <mark.king@markzz.com>
# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
pkgname=libtrace
pkgver=4.0.17
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

sha256sums=('5db6572467122581c44ce505327d7882bc21d9bad4bee8c57a147cc93a29d1ac')
