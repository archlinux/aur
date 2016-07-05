# Maintainer: Veeti Paananen <veeti.paananen@rojekti.fi>
pkgname=entr
pkgver=3.6
pkgrel=1
pkgdesc="Run arbitrary commands when files change"
arch=('i686' 'x86_64')
url="http://entrproject.org/"
license=('MIT')
depends=('glibc')
source=("https://bitbucket.org/eradman/entr/get/entr-$pkgver.tar.gz")
sha256sums=('a42746d81c548d7e557d500f93422b8ec9731d719309eb2601b8be69ae0dc8eb')

# bad tar
_srcdir='eradman-entr-c15b0be493fc'

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
