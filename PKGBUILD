# Maintainer: William Sutton <will@sutton-family.org>

pkgname=gensio-git
pkgdesc="General Stream I/O"
pkgver=git
pkgrel=0
arch=(x86_64 aarch64)
url="https://sourceforge.net/projects/ser2net/"
license=('GPL')
provides=('gensio')
conflicts=('gensio')
depends=()
source=(git+https://github.com/cminyard/gensio.git)
#sha256sums=('b77e624b368bbee9b78b3b1e2f356680f701b36cc82356f36d90355963ee00e2')
sha256sums=('SKIP')

build() {
  cd "$srcdir"/${pkgname}
  test -x configure || ./reconf
  ./configure --prefix=/usr --sbindir=/usr/bin --with-python=no
  make
}

package() {
  cd "$srcdir"/${pkgname}
  make DESTDIR="$pkgdir" install
}
