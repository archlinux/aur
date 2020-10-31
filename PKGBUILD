# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='reco'
pkgver=2.4.1
pkgrel=1
pkgdesc='Record talks to remember the contents later'
arch=('x86_64')
url='https://github.com/ryonakano/reco'
license=('GPL3')
depends=('granite' 'gstreamer')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('cf569a9eff6bb5b82a2e033a6410a4db2f1aba52b2bb78138c7e04fad8e20e04')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}

# vim: ts=2 sw=2 et:
