# Maintainer: David Birks <david@birks.dev>

pkgname=opa
pkgver=0.21.1
pkgrel=1
pkgdesc='Command-line utility and REPL for Open Policy Agent'
arch=(x86_64)
url='https://github.com/open-policy-agent/opa'
license=(Apache)
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/open-policy-agent/opa/archive/v$pkgver.tar.gz")
sha256sums=('87813ab618fd465c6becfd4bb32c2461257d80e5ddd6eb13de0a27a195a4cccf')

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
