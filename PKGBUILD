# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=harvey
pkgver=1.0.0
pkgrel=1
pkgdesc='WCAG color contrast compliance checker'
arch=('x86_64')
url='https://github.com/danrabbit/harvey'
license=('GPL2')
depends=('granite')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('51d8e5d8e6eab405a713dcb635bfbff75c3187fdf8a0c5e16d5bec400a81a758')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}

# vim: ts=2 sw=2 et:
