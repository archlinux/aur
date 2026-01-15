# Maintainer: Marcel B <mr.arsikoff@gmail.com>
pkgname="antares-circuit"
pkgver=1.32.0
pkgrel=1
pkgdesc="Digital circuit learning platform"
arch=('any')
url="https://github.com/flandreas/antares"
license=("LicenseRef-freeware")
depends=("java-runtime>=16" "hicolor-icon-theme" "sh")
source=(
  "antares-circuit.desktop"
  "antares-circuit.sh"
  "icon-16x16.png"
  "icon-32x32.png"
  "icon-64x64.png"
  "icon-128x128.png"
  "${pkgname}.jar::${url}/releases/download/v${pkgver}/antares-${pkgver}.jar"
)
b2sums=('62919aa5599f9d34ee7a0ffd7d681ac4a29143e619c2bc9e22018eef5c22e5c57719c25dfdd79676aad20432c84ba1513e91548e8e4804102c0f30365fe1efb6'
  'f3beeb81761428a7e12c393d2ebe3bdc241cfe59605f9e4015ea8561d492879d57096853675b62936039d52c4c70915a1a40322070ed3ef96f17ee686571f6db'
  '58c685797237a7c57b5318115233d07fa367be0af2ae6663a8180a7ba79a2b5b1ec1722ed95dd67a10d2cdb28682bcde5e995d290f81c4dbbba35d217328c86d'
  'bbed0b5f62ffb4cd36e249bdb7da4ca9408a4125327590ad168bd9ceede5b120f3aceb9e3c2339ceded5c0a0fe452a3e3b25a9bda2d5ffe531137e5726aed0d6'
  '598d57052c5fd43a6bbce2f1d77aba456b826014657f797f0c8b6ec4c2f862f476a150d5d3bbffa0276ece90951130ddc5de66e88cc9681c33c62e9b1c6bb76b'
  'af22b1bb63f908e882078c2ff28f5c3b0e2bd2a474568de34ecb1f7e62e88309724aee2de054f4ec07d4243d600514b12d599c85c87a2676ef52e9ee87a4b641'
  '497cb668ced5cb485df0fb283dd60e3e9f6f46f512870b89c87aef71476c0200c5e74ba59f570403d5ca64119e74e11378ead9bf09f0462d74f3c54915042446')

package() {
  install -dm755 "${pkgdir}/usr/share/java/antares-circuit"
  install -Dm644 "${srcdir}/${pkgname}.jar" "${pkgdir}/usr/share/java/antares-circuit/antares-circuit.jar"
  for r in 16x16 32x32 64x64 128x128; do
    install -Dm644 "${srcdir}/icon-${r}.png" "${pkgdir}/usr/share/icons/hicolor/${r}/apps/antares-circuit.png"
  done
  install -Dm644 "${srcdir}/antares-circuit.desktop" "${pkgdir}/usr/share/applications/antares-circuit.desktop"
  install -Dm755 "${srcdir}/antares-circuit.sh" "${pkgdir}/usr/bin/antares-circuit"
}
