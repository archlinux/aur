# Maintainer: Mort Yao <soi@mort.ninja>
# Contributor: Taylor Venable <taylor@metasyntax.net>

pkgname='kawa'
pkgver='2.2'
pkgrel=1
pkgdesc='A Scheme implementation and framework targeted the JVM.'
arch=('i686' 'x86_64')
url='http://www.gnu.org/software/kawa/index.html'
license=('X11/MIT')
depends=('java-environment')
source=("http://ftp.gnu.org/pub/gnu/kawa/$pkgname-$pkgver.tar.gz")
sha256sums=('c3e2cb5ae772e7441ac31484083bcee651de941bbfed5dbe4874964839b9ba32')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make -j1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make -j1 DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
