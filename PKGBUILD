# Maintainer: David Birks <david@birks.dev>

pkgname=conftest
pkgver=0.18.0
pkgrel=1
pkgdesc='A utility to help you write tests against structured configuration data'
arch=(x86_64)
url='https://github.com/instrumenta/conftest'
license=(Apache)
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/instrumenta/conftest/archive/v$pkgver.tar.gz")
sha512sums=('bea325d28a93e8291db689ff8dadddb473af8d8bf77f0ff9af2bf0d1172ed9eac5da128eabc2e9a5d44d80d940ec1ea08499693cfc17a215861ac1328e3f58a9')

build() {
  cd $pkgname-$pkgver

  go build \
  --trimpath \
  --ldflags "-X github.com/instrumenta/conftest/internal/commands.version=$pkgver" \
  -o conftest \
  .
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
