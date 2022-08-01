# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: atriix <aur a snilius d com>

pkgname=pint

pkgver=0.28.4
pkgrel=1
pkgdesc="Prometheus rule linter"
url="https://github.com/cloudflare/pint"
license=('Apache2')
arch=('x86_64')
depends=()
makedepends=('go')

source=(https://github.com/cloudflare/pint/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('721ee5091be09b6f6c36ce67c27d6224b210c0bcfef377b323d1fb5f0a79c136a3fd301d9649183aa3fd771cc0596ed142496505144ce46c92dadf6c2293e0f3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 pint $pkgdir/usr/bin/pint
}
