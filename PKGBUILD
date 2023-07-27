# Maintainer: Kevin Meagher <kmeagher@icecube.wisc.edu>
pkgname=nuflux
pkgver=2.0.4
pkgrel=0
pkgdesc="A library for calculating atmospheric neutrino fluxes"
arch=('x86_64')
url="https://github.com/icecube/nuflux"
license=('LGPL3')
depends=('glibc' 'gcc-libs' 'cfitsio' 'boost-libs' 'photospline')
makedepends=('meson')
source=("https://github.com/icecube/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e7c95901ffc2d1a5c8cbe3f0a24c0277156762d131ef0facaad28b2b931bcfa7')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
