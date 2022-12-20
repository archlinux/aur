# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: atriix <aur a snilius d com>

pkgname=pint

pkgver=0.39.0
pkgrel=1
pkgdesc="Prometheus rule linter"
url="https://github.com/cloudflare/pint"
license=('Apache2')
arch=('x86_64')
depends=()
makedepends=('go')

source=(https://github.com/cloudflare/pint/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('92f8ffef01eb436732590ae30a8a762b0fa62c973815adf658b2573340a43265733e933e040cb6b7c9f475903b53d8f83e816c66de6b5c0144fe85842eb2d78c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  PINT_VERSION="v$pkgver" make build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 pint $pkgdir/usr/bin/pint
}

