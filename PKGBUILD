# Maintainer: Jan Peter Koenig <public@janpeterkoenig.com>
# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
pkgname=libtrace
pkgver=4.0.12
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

sha256sums=('ab18e5ce39c6071a4e97efc7e239753e28df3b809cc3f20de48aa267c6305817')
