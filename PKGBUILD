# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: ArmandasJ <armandas@gmail.com>
pkgname=aspell-lv
pkgver=0.5.5
pkgrel=2
pkgdesc="Latvian aspell dictionary"
arch=('i686' 'x86_64')
depends=('aspell')
url="ftp://ftp.gnu.org/gnu/aspell/dict/0index.html"
source=("ftp://ftp.gnu.org/gnu/aspell/dict/lv/aspell6-lv-$pkgver-1.tar.bz2"
        "ftp://ftp.gnu.org/gnu/aspell/dict/lv/aspell6-lv-$pkgver-1.tar.bz2.sig")
license=('GPL2')
sha512sums=('94a9c6da3fd29f17fbe5d02cd4764bf24379abef526725bb34c0726f7ff385fcb876df24b741bc66518295c3bb75c800aa6010130454c6dc1d6372d12d2eb98e'
            'a9c19a60ddeee7558efec6cbc63048e88092e6a10e5c10a487567a7d85c920c39e91082c7deb569eda92dbb2365b7373a2117b4e2e44c1248746656ae65157e5')

build() {
  cd "$srcdir/aspell6-lv-$pkgver-1"
  ./configure
  make
}

package() {
  cd "$srcdir/aspell6-lv-$pkgver-1"
  make DESTDIR="$pkgdir" install

  install -D "$srcdir/aspell6-lv-$pkgver-1/COPYING" "$pkgdir/usr/share/licenses/custom/$pkgname/COPYING"
}
