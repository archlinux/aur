# Maintainer: Kevin Meagher <kmeagher@icecube.wisc.edu>
pkgname=nuflux
pkgver=2.0.5
pkgrel=0
pkgdesc="A library for calculating atmospheric neutrino fluxes"
arch=('x86_64')
url="https://github.com/icecube/nuflux"
license=('LGPL-3.0-only')
depends=('glibc' 'gcc-libs' 'cfitsio' 'boost-libs' 'photospline')
makedepends=('meson')
source=("https://github.com/icecube/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('65cb0c284cc46e1006f1eb1fba296b84e30a148d4386887de152961ba711d6b8')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
