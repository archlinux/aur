# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='Sherlock'
pkgname="${_pkgname,,}"
pkgver=1.0.2
pkgrel=1
pkgdesc='Find information about public IP address'
arch=('x86_64')
url='https://github.com/sergius02/Sherlock'
license=('GPL3')
depends=('granite')
makedepends=('meson' 'vala')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('6327fbf3f684e18da695ed4c7a7b8a764dd8c895b3c263034d1248b4c0939325')

build() {
  arch-meson "${_pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${_pkgname}-${pkgver}/README.md"
}

# vim: ts=2 sw=2 et:
