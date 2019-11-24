# Maintainer: Rihards Skuja <rhssk at posteo dot eu>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: ArmandasJ <armandas@gmail.com>
pkgname=aspell-lv
pkgver=0.5.5
pkgrel=4
pkgdesc='Latvian aspell dictionary'
arch=('any')
depends=('aspell')
url='https://ftp.gnu.org/gnu/aspell/dict/0index.html'
source=("https://ftp.gnu.org/gnu/aspell/dict/lv/aspell6-lv-$pkgver-1.tar.bz2"
        "https://ftp.gnu.org/gnu/aspell/dict/lv/aspell6-lv-$pkgver-1.tar.bz2.sig")
license=('GPL2')
sha256sums=('3c30e206ea562b2e759fb7467680e1a01d5deec5edbd66653c83184550d1fb8a'
            'SKIP')
validpgpkeys=('31A768B0808E4BA619B48F81B6D9D0CC38B327D7')

build() {
  cd "$srcdir/aspell6-lv-$pkgver-1"
  ./configure
  make
}

package() {
  cd "$srcdir/aspell6-lv-$pkgver-1"
  make DESTDIR="$pkgdir" install
  install -Dm655 COPYING "$pkgdir/usr/share/licenses/custom/$pkgname/COPYING"
}
