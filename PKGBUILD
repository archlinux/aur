# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

# TODO: Add icon when available upstream

pkgname=pdfquirk
pkgver=0.9
pkgrel=1
pkgdesc="Create PDFs from images or scanner"
arch=('x86_64')
url="https://dragotin.github.io/quirksite/"
license=('GPL3')
source=("https://github.com/dragotin/pdfquirk/archive/v${pkgver}.tar.gz")
depends=('imagemagick')
optdepends=('sane: scanning support')
makedepends=('cmake' 'qt5-base')
provides=("${pkgname}")
conflicts=("${pkgname}")
sha256sums=('61df1a33095373f72f83b85d106a89da0865850deec4a6d5228eb4243547910e')

build() {
  cd "${pkgname}-${pkgver}"
  cmake .
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}