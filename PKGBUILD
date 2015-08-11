# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>

pkgname=nicstat
pkgver=1.95
pkgrel=1
pkgdesc='Network traffic statics utility'
arch=('i686' 'x86_64')
url='http://nicstat.sourceforge.net/'
license=('Artistic2.0')
depends=(bash)
source=("$pkgname-$pkgver.tar.gz::http://sourceforge.net/projects/nicstat/files/$pkgname-src-$pkgver.tar.gz/download")
sha256sums=('7a7fa23118e17c4b184a288f4a9b4b042a2679298bdecc277b3e04dad791235f')
build() {
  cd "$srcdir"/$pkgname-src-$pkgver
#  make -f Makefile.Linux
  gcc $CFLAGS -o nicstat nicstat.c $LDFLAGS
}
package(){
  cd "$srcdir"/$pkgname-src-$pkgver
#  install -Dm755 $(./nicstat.sh --bin-name) "$pkgdir"/usr/bin/nicstat
  install -Dm755 nicstat "$pkgdir"/usr/bin/nicstat
  install -Dm755 enicstat "$pkgdir"/usr/bin/enicstat
  install -Dm644 nicstat.1 "$pkgdir"/usr/share/man/man1/nicstat.1
}
