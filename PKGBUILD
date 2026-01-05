# Maintainer: DasCanard
pkgname=radioss
pkgver=0.9.0
pkgrel=1
pkgdesc="A modern, cross-platform internet radio player built with Tauri, React, and TypeScript"
arch=('x86_64')
url="https://github.com/DasCanard/radioss"
license=('MIT')
depends=('openssl' 'webkit2gtk')
source=("radioss-${pkgver}.deb::https://github.com/DasCanard/radioss/releases/download/v0.9.0/radioss_0.9.0_amd64_linux.deb")
sha256sums=('604dd6bf6600ee5284e3972ac424937b5a77c4f1b6a98d8538ecc52aba1cfd43')

package() {
  # Extract .deb package
  ar x "${srcdir}/radioss-${pkgver}.deb"
  tar -xf data.tar.xz
  
  # Install files
  cp -r usr/* "${pkgdir}/"
}
