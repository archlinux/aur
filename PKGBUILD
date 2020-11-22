# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='stocks'
pkgname="simple-${_pkgname}"
pkgver=1.0.9
pkgrel=1
pkgdesc='Keep tabs on your favorite stocks'
arch=('x86_64')
url='https://github.com/brendanperry/stocks'
license=('GPL3')
depends=('granite')
makedepends=('meson' 'vala')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('7af56cce94c55cd1398847b83f1ad46b467c9e9cb969a059735aaf562942296c')

build() {
  arch-meson "${_pkgname}-${pkgver}" 'build'
  meson compile -C 'build'
}

package() {
  DESTDIR="${pkgdir}" meson install -C 'build'
  install -Dvm644 "${_pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
