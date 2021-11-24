# Maintainer: Kevin Meagher <kmeagher@icecube.wisc.edu>
pkgname=nuflux
pkgver=2.0.3
pkgrel=1
pkgdesc="A library for calculating atmospheric neutrino fluxes"
arch=('x86_64')
url="https://github.com/icecube/nuflux"
license=('LGPL3')
depends=('boost' 'photospline')
makedepends=('meson')
source=("https://github.com/icecube/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b7a3c88107c73b81bf021acd5e6e69f9646811cc041b1dc14fffbdffcd736981')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
