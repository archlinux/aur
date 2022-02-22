# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: atriix <aur a snilius d com>

pkgname=pint

pkgver=0.13.1
pkgrel=1
pkgdesc="Prometheus rule linter"
url="https://github.com/cloudflare/pint"
license=('Apache2')
arch=('x86_64')
depends=()
makedepends=('go')

source=(https://github.com/cloudflare/pint/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('3aa091a43ea3b95cbf00991f16076d6d62f48addc0dd78b627d2ff1d887593db0e3735044d150fc0e80e15e2a4d667ceafaf1084e22ab9ee34e6f9a878e9f483')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 pint $pkgdir/usr/bin/pint
}
