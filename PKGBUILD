# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Helder Bertoldo <helder.bertoldo@gmail.com>

pkgname=regextester
pkgver=1.1.0
pkgrel=2
pkgdesc='A simple regex tester'
arch=('x86_64')
url='https://github.com/artemanufrij/regextester'
license=('GPL3')
depends=('granite')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('a9785c86357288632079bad7d897af7d2216e8ed2fcf6467f9991fd7adb26d3b')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}

# vim: ts=2 sw=2 et:
