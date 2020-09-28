# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='hourglass'
pkgver=1.2.3
pkgrel=1
pkgdesc='Simple clock application that provides stopwatches, alarms, and timers'
arch=('x86_64')
url='https://github.com/sgpthomas/hourglass'
license=('GPL3')
depends=('granite' 'libnotify')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('37621049ff33ad10db9e1a7e011a9b47db4166ffeb3df3b0d6309961e5b8e798')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}

# vim: ts=2 sw=2 et:
