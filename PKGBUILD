# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='findfileconflicts'
pkgver=1.1.3
pkgrel=1
pkgdesc='Detect and solve possible file conflicts'
arch=('x86_64')
url='https://github.com/artemanufrij/findfileconflicts'
license=('GPL3')
depends=('granite')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('027d280232703a024033add4f68c7b93e8c56340ecf4a7d20dc82bdcb990bb2b')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}

# vim: ts=2 sw=2 et:
