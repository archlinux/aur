# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='reco'
pkgver=3.0.1
pkgrel=1
pkgdesc='An audio recording app designed for elementary OS'
arch=('x86_64')
url='https://github.com/ryonakano/reco'
license=('GPL3')
depends=('granite' 'gstreamer')
makedepends=('meson' 'vala' 'libhandy')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('aada1ba503514ce842d84f0f460b5a2af6942c93b82d7bb4c1b8972cec421738')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}
