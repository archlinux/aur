# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=nicstat
pkgver=1.92
pkgrel=3
pkgdesc='Network traffic statics utility'
arch=('i686' 'x86_64')
url='http://nicstat.sourceforge.net/'
license=('Artistic2.0')
groups=()
depends=(bash)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("$pkgname-$pkgver.tar.gz::http://sourceforge.net/projects/nicstat/files/$pkgname-src-$pkgver.tar.gz/download"
)
noextract=()
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
md5sums=('c1bf0a98f27830462f81894bfb447fd8')
