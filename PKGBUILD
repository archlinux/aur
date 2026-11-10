# Maintainer: KafCoppelia <k740677208@gmail.com>

pkgname=zotero-wakatime
pkgver=0.2.2
pkgrel=1
pkgdesc='WakaTime time tracking integration for Zotero'
arch=('any')
url='https://github.com/wakatime/zotero-wakatime'
license=('AGPL-3.0-or-later')
groups=('zotero-addons')
optdepends=('wakatime: provide the CLI')
source=(
  "zotero-waka-time-${pkgver}.xpi::https://github.com/wakatime/zotero-wakatime/releases/download/zotero-wakatime-v${pkgver}/zotero-waka-time.xpi"
  "LICENSE::https://raw.githubusercontent.com/wakatime/zotero-wakatime/zotero-wakatime-v${pkgver}/LICENSE"
)
sha256sums=(
  '9030e33716c2657d74a3208bc9c575e2c724df5bb9c7e2abade5803ef7137217'
  '76a97c878c9c7a8321bb395c2b44d3fe2f8d81314d219b20138ed0e2dddd5182'
)

package() {
  install -Dm644 "${srcdir}/zotero-waka-time-${pkgver}.xpi" \
    "${pkgdir}/usr/lib/zotero/distribution/extensions/zotero-wakatime@wakatime.com.xpi"
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
