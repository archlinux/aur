# Maintainer: Profullstack, Inc. <security@profullstack.com>
# AUR binary package — consumes the GitHub release tarball.
pkgname=tronbrowser-bin
pkgver=3.16.0
pkgrel=1
pkgdesc="Open-source, privacy-first, AI-native browser (Ungoogled Chromium fork)"
arch=('x86_64')
url="https://tronbrowser.dev"
license=('MIT')
depends=('chromium')
provides=('tronbrowser')
conflicts=('tronbrowser')
source=("tronbrowser-${pkgver}.tar.gz::https://github.com/profullstack/tronbrowser.dev/releases/download/v${pkgver}/tronbrowser-linux-x64.tar.gz")
sha256sums=('890dc050ad080174f94a8e54275fc64072dff515a6237bb4bd0d66fce8d31fe5')

package() {
  install -dm755 "${pkgdir}/usr/lib/tronbrowser"
  cp -r "${srcdir}/tronbrowser/." "${pkgdir}/usr/lib/tronbrowser/"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /usr/lib/tronbrowser/tronbrowser "${pkgdir}/usr/bin/tron"
  ln -s /usr/lib/tronbrowser/tronbrowser "${pkgdir}/usr/bin/tronbrowser"
  install -Dm644 "${srcdir}/tronbrowser/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
