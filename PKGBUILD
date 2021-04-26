# Maintainer: David Birks <david@birks.dev>

pkgname=opa
pkgver=0.27.1
pkgrel=1
pkgdesc='Command-line utility and REPL for Open Policy Agent'
arch=(x86_64)
url='https://github.com/open-policy-agent/opa'
license=(Apache)
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/open-policy-agent/opa/archive/v$pkgver.tar.gz")
sha256sums=('d1f3cee2261adc83df54fba2d62b045549d064ac14b7683031ec3897c2bdbd44')

build() {
  cd $pkgname-$pkgver

  go build \
  --trimpath \
  --ldflags "-X github.com/open-policy-agent/opa/version.Version=$pkgver" \
  -o opa \
  .
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
