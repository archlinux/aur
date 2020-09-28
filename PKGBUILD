# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='typewriter'
pkgver=0.4.1
pkgrel=1
pkgdesc='Minimal writer with autosave'
arch=('x86_64')
url='https://github.com/manexim/typewriter'
license=('GPL3')
depends=('granite' 'gtksourceview3')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('ae3d8827d04dad083cf9bd3109353fcf9a03fb90afc3e8cd71f18a8824282e9f')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}

# vim: ts=2 sw=2 et:
