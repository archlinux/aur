# Maintainer: Kevin Meagher <kmeagher@icecube.wisc.edu>
pkgname=nuflux
pkgver=2.0.2
pkgrel=1
pkgdesc="A library for calculating atmospheric neutrino fluxes"
arch=('x86_64')
url="https://github.com/icecube/nuflux"
license=('unknown')
depends=('boost' 'photospline')
makedepends=('meson')
source=("https://github.com/icecube/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3c9d319a1c24c7327c5e30856d9b66e97c829f6dc07c86f9ff5178e6f4505208')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
