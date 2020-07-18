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
  cd "${pkgname}-${pkgver}"
  meson build --prefix=/usr
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C "${pkgname}-${pkgver}/build" install
  install -Dm644 "${pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
