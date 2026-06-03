# Maintainer: Riski Andriyanto <putra7a@gmail.com>

pkgname=comicrd-bin
_pkgname=comicrd
pkgver=0.7.1
pkgrel=1
pkgdesc="Lightweight high-performance desktop comic reader built with Tauri 2"
arch=('x86_64')
url="https://github.com/andrizan/comicRD"
license=('MIT')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libayatana-appindicator'
  'librsvg'
  'openssl'
  'hicolor-icon-theme'
)
provides=('comicrd')
conflicts=('comicrd')
source=("${_pkgname}-${pkgver}-linux-x86_64.tar.gz::https://github.com/andrizan/comicRD/releases/download/v${pkgver}/comicrd-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('84b42479928ebfbc10a0da521d19da027bd42425bc7114ae12638b735a61876b')

package() {
  install -Dm755 "${srcdir}/comicrd-${pkgver}/comicrd" "${pkgdir}/usr/bin/comicrd"
  install -Dm644 "${srcdir}/comicrd-${pkgver}/comicrd.desktop" "${pkgdir}/usr/share/applications/comicrd.desktop"

  if [ -f "${srcdir}/comicrd-${pkgver}/comicrd.png" ]; then
    install -Dm644 "${srcdir}/comicrd-${pkgver}/comicrd.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/comicrd.png"
  fi

  if [ -f "${srcdir}/comicrd-${pkgver}/LICENSE" ]; then
    install -Dm644 "${srcdir}/comicrd-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/comicrd-bin/LICENSE"
  fi
}
