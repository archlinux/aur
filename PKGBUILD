# Maintainer: David Birks <david@tellus.space>

pkgname=conftest
pkgver=0.16.0
pkgrel=1
pkgdesc='A utility to help you write tests against structured configuration data'
arch=(x86_64)
url='https://github.com/instrumenta/conftest'
license=(Apache)
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/instrumenta/conftest/archive/v$pkgver.tar.gz")
sha512sums=('eed88160ea011b5abe6873ab28e68b6121d0da9dfb95b10f4326465363ef1f73d53d5ad9dd800122bbf4a03b2f54f4c0c8a58d5e526367b9766beec7b871ce96')

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
