# Maintainer: Gergely Polonkai <gergely at polonkai dot eu>
pkgname=aspell-is
pkgver=0.50
pkgrel=1
pkgdesc='Icelandic aspell dictionary'
arch=('i686' 'x86_64')
depends=('aspell')
url='ftp://ftp.gnu.org/gnu/aspell/dict/0index.html'
source=("ftp://ftp.gnu.org/gnu/aspell/dict/is/aspell-is-$pkgver-4.tar.bz2"
        "ftp://ftp.gnu.org/gnu/aspell/dict/is/aspell-is-$pkgver-4.tar.bz2.sig")
license=('GPL2')
sha256sums=('a8185210b6d3ba6dc217682d10ca3b69ac0d0ea0aff2e4c8fdcbb0e6d1c66955'
            'SKIP')
validpgpkeys=('31A768B0808E4BA619B48F81B6D9D0CC38B327D7')

build() {
  cd "$srcdir/aspell-is-$pkgver-4"
  ./configure
  make
}

package() {
  cd "$srcdir/aspell-is-$pkgver-4"
  make DESTDIR="$pkgdir" install
  install -Dm655 COPYING "$pkgdir/usr/share/licenses/custom/$pkgname/COPYING"
}
