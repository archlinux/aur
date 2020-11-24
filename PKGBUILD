# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='palaura'
pkgver=1.5.0
pkgrel=1
pkgdesc='Find any words definition with this handy dictionary'
arch=('x86_64')
url='https://github.com/lainsce/palaura'
license=('GPL3')
depends=('granite' 'gtksourceview3')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('302f638bb4735761a3507f8785f79f65ec9b0d9eb35eb774d246549b34baa494')

build() {
  arch-meson "${pkgname}-${pkgver}" 'build'
  meson compile -C 'build'
}

package() {
  DESTDIR="${pkgdir}" meson install -C 'build'
  install -Dvm644 "${pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
