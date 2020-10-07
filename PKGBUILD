# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='QRit'
pkgname="${_pkgname,,}"
pkgver=1.0.4
pkgrel=1
pkgdesc='Create awesome QR codes'
arch=('x86_64')
url='https://github.com/sergius02/QRit'
license=('GPL3')
depends=('granite' 'qrencode')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d1fa39cd672c7be684b445284e7fb815e0a6fb57068c08f7869a9e946dde4cdb')

build() {
  arch-meson "${_pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${_pkgname}-${pkgver}/README.md"
}

# vim: ts=2 sw=2 et:
