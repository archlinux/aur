# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: atriix <aur a snilius d com>

pkgname=pint

pkgver=0.34.0
pkgrel=1
pkgdesc="Prometheus rule linter"
url="https://github.com/cloudflare/pint"
license=('Apache2')
arch=('x86_64')
depends=()
makedepends=('go')

source=(https://github.com/cloudflare/pint/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('efacf8fefdb2b2b21cdb315cf7a80ed65f03d5ee7bb5dea1d928a9075c1b095ffddbde571a4758cc980778f8cd35df34c128c46e1702089e4d26824340d970b6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  PINT_VERSION="v$pkgver" make build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 pint $pkgdir/usr/bin/pint
}

