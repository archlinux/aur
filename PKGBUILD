# Maintainer: David Birks <david@birks.dev>

pkgname=conftest
pkgver=0.19.0
pkgrel=1
pkgdesc='A utility to help you write tests against structured configuration data'
arch=(x86_64)
url='https://github.com/open-policy-agent/conftest'
license=(Apache)
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/open-policy-agent/conftest/archive/v$pkgver.tar.gz")
sha512sums=('19cf0e6c0cbc797c6d294f7855f6fd18c7e81483e2c10a457ee08d401f00130e89e22d74acf24b7ac8483aa72a23d82c6a7e5f8d14a277d8dca88d1ecdaddcc1')

build() {
  cd $pkgname-$pkgver

  go build \
  --trimpath \
  --ldflags "-X github.com/open-policy-agent/conftest/internal/commands.version=$pkgver" \
  -o conftest \
  .
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
