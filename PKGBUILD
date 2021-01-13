# Maintainer: Val Saven <valsaven@gmail.com>

pkgname=noto
pkgver=1.1
pkgrel=1
pkgdesc="A command line journal."
arch=('x86_64')
url="https://github.com/valsaven/noto"
license=('GPL3')
makedepends=('gcc' 'git')
provides=("$pkgname")
conflicts=("$pkgname")

sha256sums=('87a342fb33a142ae1d2a73300ebd1900e0149c3b51d5da8777d2a171efc0fb07')

source=("noto-${pkgver}.tar.gz::https://github.com/valsaven/noto/archive/v${pkgver}.tar.gz")

build() {
  cd "$pkgname-$pkgver"
  make build
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "./noto" "${pkgdir}/usr/bin/noto"
}
