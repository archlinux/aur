# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='reco'
pkgver=2.4.2
pkgrel=1
pkgdesc='Record talks to remember the contents later'
arch=('x86_64')
url='https://github.com/ryonakano/reco'
license=('GPL3')
depends=('granite' 'gstreamer')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('890ec4f5909c0f43ce8fb45623a59fb5f18455c268eb5f76c4cec5419f3dd576')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}

# vim: ts=2 sw=2 et:
