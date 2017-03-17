# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

pkgname=clib
pkgver=1.8.0
pkgrel=1
pkgdesc="C package manager-ish"
arch=(i686 x86_64)
url="https://github.com/clibs/clib"
license=('MIT')
depends=('curl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/clibs/clib/archive/$pkgver.tar.gz")
sha512sums=('636f47d4291c6ce498f8112f2915b915faaaf26075c92e831106e97aca6a0917f42c1990a8a24a68f129aa64b6d7731554ae47c583c0e5610e795839f55bb595')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
