# Maintainer: Veeti Paananen <veeti.paananen@rojekti.fi>
pkgname=entr
pkgver=3.3
pkgrel=1
pkgdesc="Run arbitrary commands when files change"
arch=('i686' 'x86_64')
url="http://entrproject.org/"
license=('MIT')
depends=('glibc')
source=("http://entrproject.org/code/entr-$pkgver.tar.gz")
sha256sums=('701cb7b0a72b6c9ba794ad7cc15b6ebcc2e0c978bb6906c8ae407567a044461f')

# bad tar
_srcdir='eradman-entr-220131754e1c'

build() {
  cd "$srcdir/$_srcdir"

  ./configure
  make
}

check() {
  cd "$srcdir/$_srcdir"

  make -k test
}

package() {
  cd "$srcdir/$_srcdir"

  make PREFIX="$pkgdir/usr" install
  install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
