# Maintainer: Veeti Paananen <veeti.paananen@rojekti.fi>
pkgname=entr
pkgver=3.9
pkgrel=1
pkgdesc="Run arbitrary commands when files change"
arch=('i686' 'x86_64')
url="http://entrproject.org/"
license=('MIT')
depends=('glibc')
source=("https://bitbucket.org/eradman/entr/get/entr-$pkgver.tar.gz")
sha256sums=('02d78f18ae530e64bfbb9d8e0250962f85946e10850dd065899d03af15f26876')

# bad tar
_srcdir='eradman-entr-332fd96a324a'

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
