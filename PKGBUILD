# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: atriix <aur a snilius d com>

pkgname=pint

pkgver=0.44.1
pkgrel=1
pkgdesc="Prometheus rule linter"
url="https://github.com/cloudflare/pint"
license=('Apache2')
arch=('x86_64')
depends=()
makedepends=('go')

source=(https://github.com/cloudflare/pint/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('e37bf30a78913a1c1da43560e16fbc21965c96e7672aef3e7c0a47aabdde6c5244bc2f00d741f5f94c7983ab4c1648e31a72a4428ed390c38b6f535a1323e06a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  PINT_VERSION="v$pkgver" make build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 pint $pkgdir/usr/bin/pint
}

