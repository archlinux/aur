# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='reco'
pkgver=2.4.0
pkgrel=1
pkgdesc='Record talks to remember the contents later'
arch=('x86_64')
url='https://github.com/ryonakano/reco'
license=('GPL3')
depends=('granite' 'gstreamer')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('0490b6fb7f24bb5f48b9c21ae4b0ba8c2c69645344ce27df490be9ec70fd7486')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}

# vim: ts=2 sw=2 et:
