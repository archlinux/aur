# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='QRit'
pkgname="${_pkgname,,}"
pkgver=1.1.3
pkgrel=1
pkgdesc='Create awesome QR codes'
arch=('x86_64')
url='https://github.com/sergius02/QRit'
license=('GPL3')
depends=('granite' 'qrencode')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('ef81c02adfcdb13c86f22848c73486ab87779665ebf8a06714358c258b88e6c8')

build() {
  arch-meson "${_pkgname}-${pkgver}" 'build'
  meson compile -C 'build'
}

package() {
  DESTDIR="${pkgdir}" meson install -C 'build'
  install -Dvm644 "${_pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
