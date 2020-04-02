# Maintainer: Marc ROGER de CAMPAGNOLLE <fora at mrdc dot fr>

pkgname=libhdcd
pkgver=1.4
pkgrel=2
pkgdesc="An HDCD decoder library"
arch=('i686' 'x86_64')
url="https://github.com/bp0/$pkgname"
license=('BSD' 'MIT' 'Apache')
makedepends=('autoconf' 'make')
source=("$url/archive/v$pkgver.tar.gz")
sha512sums=('21aa3a4f1abb417af228e320a504675d3af0a61ce287ec89601b51abb28dd2e3fc855849e36bd882ebf8b60c024fab481362e9ba4fdf73c6e0ef33995751b25d')

build() {
  cd "$srcdir/$pkgname-$pkgver/"
  autoreconf -ivf
  ./configure --prefix="/usr"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  make DESTDIR="$pkgdir" install
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" AUTHORS README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
