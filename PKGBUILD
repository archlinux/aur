# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='palaura'
pkgver=1.5.1
pkgrel=1
pkgdesc='Find any words definition with this handy dictionary'
arch=('x86_64')
url='https://github.com/lainsce/palaura'
license=('GPL3')
depends=('granite' 'gtksourceview3')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('b07eadce97571a30326e3563f9d02dad9c0d41bbcac721033a487c2dcb00a9d9')

build() {
  arch-meson "${pkgname}-${pkgver}" 'build'
  meson compile -C 'build'
}

package() {
  DESTDIR="${pkgdir}" meson install -C 'build'
  install -Dvm644 "${pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
