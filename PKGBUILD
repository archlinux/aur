# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=pdfquirk
pkgver=0.91
pkgrel=1
pkgdesc="Create PDFs from images or scanner"
arch=('x86_64')
url="https://dragotin.github.io/quirksite/"
license=('GPL3')
source=("https://github.com/dragotin/pdfquirk/archive/v${pkgver}.tar.gz")
depends=('imagemagick')
optdepends=('sane: scanning support')
makedepends=('cmake' 'extra-cmake-modules' 'qt5-base')
provides=("${pkgname}")
conflicts=("${pkgname}")
sha256sums=('f6aed0c2f5eb2056c47948ef321f614b9fba7b44fe968bb878661e7469ca3bfa')

build() {
  cd "${pkgname}-${pkgver}"
  cmake .
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "resources/64-apps-pdfquirk.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}