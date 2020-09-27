# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='graphui'
pkgver=1.1.1
pkgrel=1
pkgdesc='Graph visualization based on graphviz with included text editor and preview area'
arch=('x86_64')
url='https://github.com/artemanufrij/graphui'
license=('GPL3')
depends=('granite' 'gtksourceview3')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('8520a394bbd2072aac2db03b1c3fa54d1f32459caafa85c9bc0fa43eadbe1a80')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}

# vim: ts=2 sw=2 et:
