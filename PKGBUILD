# Maintainer: David Birks <david@birks.dev>

pkgname=conftest
pkgver=0.17.0
pkgrel=1
pkgdesc='A utility to help you write tests against structured configuration data'
arch=(x86_64)
url='https://github.com/instrumenta/conftest'
license=(Apache)
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/instrumenta/conftest/archive/v$pkgver.tar.gz")
sha512sums=('97a5d5d73266cb1f87138f514fe7275b228de39ed8da7728e1d85223dc3a3bf727b72570eb9d0660c867e957a4db2b171a9cefa62108f9313268cf20ddea4a15')

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
