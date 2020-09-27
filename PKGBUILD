# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='translit'
pkgver=1.0.0
pkgrel=1
pkgdesc='Simple method of encoding Cyrillic letters with Latin ones'
arch=('x86_64')
url='https://github.com/artemanufrij/translit'
license=('GPL3')
depends=('granite' 'gtkspell3')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('e631f71cf6099ebfb152dd0a4222d50cbc677dfbd8e3ef3ebc61b8650fdc9f14')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}

# vim: ts=2 sw=2 et:
