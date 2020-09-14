# Maintainer: David Birks <david@birks.dev>

pkgname=conftest
pkgver=0.21.0
pkgrel=1
pkgdesc='A utility to help you write tests against structured configuration data'
arch=(x86_64)
url='https://github.com/open-policy-agent/conftest'
license=(Apache)
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/open-policy-agent/conftest/archive/v$pkgver.tar.gz")
sha512sums=('2e91bb5d7ea58aa41aeb15ad860d9ce63601cf150aefdaccb1f36777dfa56936347dbaa11088cf3ccf8a40d427f9473c7ff7d21bf0afbafc7353fcd417003f2b')

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
