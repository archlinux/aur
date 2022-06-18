# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='reco'
pkgver=3.3.1
pkgrel=1
pkgdesc='An audio recording app designed for elementary OS'
arch=('x86_64')
url='https://github.com/ryonakano/reco'
license=('GPL3')
depends=('granite' 'gstreamer')
makedepends=('meson' 'vala' 'libhandy')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('545e898b4cfb849392d17e8ee95cbb5daf806f1ea60f532edfab36b33bcb4c63')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}
