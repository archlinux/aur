# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='QRit'
pkgname="${_pkgname,,}"
pkgver=1.1.1
pkgrel=1
pkgdesc='Create awesome QR codes'
arch=('x86_64')
url='https://github.com/sergius02/QRit'
license=('GPL3')
depends=('granite' 'qrencode')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('337c59edf403339e0e8e67d71dffc2d20bc2fc1d2ad76fa9ba1bf7edde0cc6b3')

build() {
  arch-meson "${_pkgname}-${pkgver}" 'build'
  meson compile -C 'build'
}

package() {
  DESTDIR="${pkgdir}" meson install -C 'build'
  install -Dvm644 "${_pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
