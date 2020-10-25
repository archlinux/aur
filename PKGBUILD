# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='typewriter'
pkgver=0.4.3
pkgrel=1
pkgdesc='Minimal writer with autosave'
arch=('x86_64')
url='https://github.com/manexim/typewriter'
license=('GPL3')
depends=('granite' 'gtksourceview3')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('32749d2441bc54a441ee4eba2a9cf77ee30ef19dcb6ba49400f11450926b8807')

build() {
  arch-meson "${pkgname}-${pkgver}" 'build'
  meson compile -C 'build'
}

package() {
  DESTDIR="${pkgdir}" meson install -C 'build'
  install -Dvm644 "${pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
