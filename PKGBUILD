# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='ghistory'
pkgver=1.0.1
pkgrel=1
pkgdesc='Graphic interface for your bash history'
arch=('x86_64')
url='https://github.com/padjis/ghistory'
license=('GPL3')
depends=('granite')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('839305235dd134d4f036f7aeedfdd6614b5ba2d0e08877c459783e17399ff173')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}

# vim: ts=2 sw=2 et:
