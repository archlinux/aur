# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='Sherlock'
pkgname="elementary-${_pkgname,,}"
pkgver=1.1.0
pkgrel=1
pkgdesc='Find information about public IP address'
arch=('x86_64')
url='https://github.com/sergius02/Sherlock'
license=('GPL3')
depends=('granite')
makedepends=('meson' 'vala')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('d7b6d26f3db439a1f6c587bd53ea7453eafbdddcc90eda36642b187ca6186fb5')

build() {
  arch-meson "${_pkgname}-${pkgver}" 'build'
  meson compile -C 'build'
}

package() {
  DESTDIR="${pkgdir}" meson install -C 'build'
  install -Dvm644 "${_pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
