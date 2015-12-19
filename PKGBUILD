# Maintainer: Veeti Paananen <veeti.paananen@rojekti.fi>
pkgname=entr
pkgver=3.4
pkgrel=1
pkgdesc="Run arbitrary commands when files change"
arch=('i686' 'x86_64')
url="http://entrproject.org/"
license=('MIT')
depends=('glibc')
source=("https://bitbucket.org/eradman/entr/get/entr-$pkgver.tar.gz")
sha256sums=('ce7d000fd6f2b711df905e9a6d8a2a0f50026ebaf34afeb9132d52617b6e010a')

# bad tar
_srcdir='eradman-entr-5321b01c9dab'

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
