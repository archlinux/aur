# Maintainer: Brian Atkinson <brian@atkinson.mn>
# Prior Maintainer: David Birks <david@birks.dev>

pkgname=conftest
pkgver=0.27.0
pkgrel=1
pkgdesc='A utility to help you write tests against structured configuration data'
arch=(x86_64)
url='https://github.com/open-policy-agent/conftest'
license=(Apache)
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/open-policy-agent/conftest/archive/v$pkgver.tar.gz")
sha512sums=('234510105e5e2cc135ebd635e1bd34950430c270cc49d8c360033727dcc7dd2e6ae3dd7bfd7b8a913d5e513dc893a1b87f4c04f5758d2d0419e3176da7f615cb')

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
