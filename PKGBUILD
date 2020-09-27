# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='metronome'
pkgver=1.0.0
pkgrel=1
pkgdesc='Simple metronome for all musicians that helps to practice several rythms at many speeds'
arch=('x86_64')
url='https://github.com/artemanufrij/metronome'
license=('GPL3')
depends=('granite' 'gstreamer')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('6d90a2f3c39094689fd07cd777c9b3b4f65527a14b93ae1e91cc4b0276adc294')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}

# vim: ts=2 sw=2 et:
