# Maintainer: OTAKUWeBer
pkgname=chesspilot
pkgver=1.1.0
pkgrel=1
pkgdesc="A fully offline chess autoplayer and position evaluator powered by ONNX and Stockfish"
arch=('x86_64')
url="https://github.com/OTAKUWeBer/ChessPilot"
license=('MIT')
depends=('tk')
options=('!strip' '!debug')
source=(
  "https://github.com/OTAKUWeBer/ChessPilot/releases/download/v${pkgver}/ChessPilot-${pkgver}-linux-x86_64"
  "chesspilot.desktop"
  "logo.png"
  "LICENSE"
)
noextract=("ChessPilot-${pkgver}-linux-x86_64")
sha256sums=(
  '422fc569a598061a43785279e40e90d76a6b49e3e3940c7b4e430a1dba294e2b'  # Raw binary
  'SKIP'  # Desktop entry
  '8d304ed8f25461f6fc69d0144e0de68403f239b8583b5120fbb5f859254c74d'  # Icon hash (replace if needed)
  'abd5c13a78e8a7ab78960805c9230d653155f1ef84413d3182d3aa56d0b09eda'
)

# Avoid split debug packages
debug_package() {
  return 0
}


package() {
  install -Dm755 "$srcdir/ChessPilot-${pkgver}-linux-x86_64" \
    "$pkgdir/usr/bin/chesspilot"

  install -Dm644 "$srcdir/chesspilot.desktop" \
    "$pkgdir/usr/share/applications/chesspilot.desktop"

  install -Dm644 "$srcdir/logo.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/chesspilot.png"

  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
