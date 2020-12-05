# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='Sherlock'
pkgname="elementary-${_pkgname,,}"
pkgver=1.2.0
pkgrel=1
pkgdesc='Find information about public IP address'
arch=('x86_64')
url='https://github.com/sergius02/Sherlock'
license=('GPL3')
depends=('granite')
makedepends=('meson' 'vala')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('230c39448640cace1d9b27424f990f79be2278bb45752eb241cfe159cd3f33ae')

build() {
  arch-meson "${_pkgname}-${pkgver}" 'build'
  meson compile -C 'build'
}

package() {
  DESTDIR="${pkgdir}" meson install -C 'build'
  install -Dvm644 "${_pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
