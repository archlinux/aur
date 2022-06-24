# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Helder Bertoldo <helder.bertoldo@gmail.com>

pkgname=regextester
pkgver=1.1.1
pkgrel=1
pkgdesc='A simple regex tester'
arch=('x86_64')
url='https://github.com/artemanufrij/regextester'
license=('GPL3')
depends=('granite')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('619e9cb465f98119c17864078d3f308ab5eed4ff1af59f4b45254033cd10a05e')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}

# vim: ts=2 sw=2 et:
