# Maintainer: Jan Peter Koenig <public@janpeterkoenig.com>
# Maintainer: Mark King <mark.king@markzz.com>
# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
pkgname=libtrace
pkgver=4.0.26
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

sha256sums=('8174322a0ca44398addf7dfabea926876ef0b88ea453023c8bd6749ac0333cab')
