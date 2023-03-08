# vim: ts=2 sts=2 sw=2 et ft=sh
# Maintainer: atriix <aur a snilius d com>

pkgname=pint

pkgver=0.42.1
pkgrel=1
pkgdesc="Prometheus rule linter"
url="https://github.com/cloudflare/pint"
license=('Apache2')
arch=('x86_64')
depends=()
makedepends=('go')

source=(https://github.com/cloudflare/pint/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('f5d000c55ee18dd075af1498342130bd3543d45bdb225ed50dc7277eb6c89bc7635c3d990a277d70d703cc16dc85becb75474c98c8cdfb7c1fe5c16caefd080b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  PINT_VERSION="v$pkgver" make build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 pint $pkgdir/usr/bin/pint
}

