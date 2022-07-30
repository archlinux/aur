# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: atriix <aur a snilius d com>

pkgname=pint

pkgver=0.28.3
pkgrel=1
pkgdesc="Prometheus rule linter"
url="https://github.com/cloudflare/pint"
license=('Apache2')
arch=('x86_64')
depends=()
makedepends=('go')

source=(https://github.com/cloudflare/pint/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('1b71bd835a6c4c9c0f08e607b518fa239668d14e903029439aef8ea8795129ff9cc846526fb8bb1f2e379029a7df7c8871d428f97fad1b9eca38714313c216be')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 pint $pkgdir/usr/bin/pint
}
