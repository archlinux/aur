# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=pdfquirk
pkgver=0.91
pkgrel=2
pkgdesc="Create PDFs from images or scanner"
arch=('x86_64')
url="https://dragotin.github.io/quirksite/"
license=('GPL3')
source=("https://github.com/dragotin/pdfquirk/archive/v${pkgver}.tar.gz")
depends=('imagemagick')
optdepends=('sane: scanning support')
makedepends=('cmake' 'extra-cmake-modules' 'glu' 'qt5-base')
provides=("${pkgname}")
conflicts=("${pkgname}")
sha256sums=('f6aed0c2f5eb2056c47948ef321f614b9fba7b44fe968bb878661e7469ca3bfa')

build() {
  cd "${pkgname}-${pkgver}"
  cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}