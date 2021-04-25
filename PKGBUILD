# Maintainer: Kevin Meagher <kmeagher@icecube.wisc.edu>
pkgname=nuflux
pkgver=2.0.1
pkgrel=1
pkgdesc="A library for calculating atmospheric neutrino fluxes"
arch=('x86_64')
url="https://github.com/icecube/nuflux"
license=('unknown')
depends=('boost' 'photospline')
makedepends=('meson')
source=("https://github.com/icecube/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("a467a63ff886db2398c688dd6b36dba2c3ca09fbb78a64a859a192b1d1036360")

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}