# Maintainer: David Birks <david@birks.dev>

pkgname=opa
pkgver=0.23.0
pkgrel=1
pkgdesc='Command-line utility and REPL for Open Policy Agent'
arch=(x86_64)
url='https://github.com/open-policy-agent/opa'
license=(Apache)
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/open-policy-agent/opa/archive/v$pkgver.tar.gz")
sha256sums=('b7e1ffc8927e41e5bfbc16081245b6e27ed6afa1b22f3a7792a4732d040db235')

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
