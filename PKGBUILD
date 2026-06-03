pkgname=comicrd-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="ComicRD desktop app"
arch=('x86_64')
url="https://github.com/andrizan/comicRD"
license=('custom')
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
source=("comicrd-${pkgver}-linux-x86_64.tar.gz::https://github.com/andrizan/comicRD/releases/download/v${pkgver}/comicrd-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('309fed6726cdb912a08e6db9bf29f738f53c3e039910ca3f3e686ebcb296f4c5')

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
