# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='palaura'
pkgver=1.2.2
pkgrel=1
pkgdesc='Find any words definition with this handy dictionary'
arch=('x86_64')
url='https://github.com/lainsce/palaura'
license=('GPL3')
depends=('granite' 'gtksourceview3')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('555c1e06981b98280e806504bc9b31e93ac501e4e4845c301982207a60d9daae')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}

# vim: ts=2 sw=2 et:
