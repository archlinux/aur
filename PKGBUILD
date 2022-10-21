# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: atriix <aur a snilius d com>

pkgname=pint

pkgver=0.30.2
pkgrel=2
pkgdesc="Prometheus rule linter"
url="https://github.com/cloudflare/pint"
license=('Apache2')
arch=('x86_64')
depends=()
makedepends=('go')

source=(https://github.com/cloudflare/pint/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('c9eef04d9ec83306f4c36818a752063c89c59bcdd9f11ace60117873d73a60a001eb298d818d1e65a68659d11657c8495957891309517cca95b951b5e8b85f67')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  PINT_VERSION="v$pkgver" make build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 pint $pkgdir/usr/bin/pint
}

