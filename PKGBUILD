# Maintainer: David Birks <david@birks.dev>

pkgname=conftest
pkgver=0.18.1
pkgrel=1
pkgdesc='A utility to help you write tests against structured configuration data'
arch=(x86_64)
url='https://github.com/instrumenta/conftest'
license=(Apache)
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/instrumenta/conftest/archive/v$pkgver.tar.gz")
sha512sums=('29c6ea79a6c9ae2feb83d65275c1926dffdbcc224d86b0d2083d250b6bffe5eca052673eb299185582d2fc618348bdf3de396c0838ba9db0b1c34ea2be576694')

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
