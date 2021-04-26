# Maintainer: David Birks <david@birks.dev>

pkgname=conftest
pkgver=0.24.0
pkgrel=1
pkgdesc='A utility to help you write tests against structured configuration data'
arch=(x86_64)
url='https://github.com/open-policy-agent/conftest'
license=(Apache)
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/open-policy-agent/conftest/archive/v$pkgver.tar.gz")
sha512sums=('5ea71eae75ac8ede4a28621a793345662bbf234dc8d4c99a958338b7e9393ee4f927ebe40f5362ea91739bad138aa55bc3cb0312ead630e62a52b64cd3dcca69')

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
