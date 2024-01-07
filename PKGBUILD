# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='reco'
pkgver=5.0.0
pkgrel=1
pkgdesc='An audio recording app designed for elementary OS'
arch=('x86_64')
url='https://github.com/ryonakano/reco'
license=('GPL3')
depends=('granite7' 'gstreamer' 'libpulse' 'ryokucha' 'live-chart')
makedepends=('meson' 'vala' 'libhandy')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('87842098a4fe01effb0d374f689e025e91b8e906eedcaed4413694db73cd3595')

build() {
  arch-meson "${pkgname}-${pkgver}" build -Duse_submodule=false
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}
