# Maintainer: OTAKUWeBer
pkgname=chesspilot
pkgver=1.0.0
pkgrel=1
pkgdesc="A fully offline chess autoplayer and position evaluator powered by ONNX and Stockfish"
arch=('x86_64')
url="https://github.com/OTAKUWeBer/ChessPilot"
license=('MIT')
depends=('stockfish' 'tk')
options=('!strip' '!debug')
source=(
  "https://github.com/OTAKUWeBer/ChessPilot/releases/download/v${pkgver}/ChessPilot-${pkgver}-linux-x86_64"
  "chesspilot.desktop"
  "logo.png"
  "LICENSE"
)
noextract=("ChessPilot-${pkgver}-linux-x86_64")
sha256sums=(
  '489b9a35147492f8dafa68d3694e7fc6dca15d7017b842ce040ae7b98362d065'  # Raw binary
  'SKIP'  # Desktop entry
  'c2e01d78d57c43b272bc765ce96074719fbd86ffbb7f5c07530b48cfaf278653'  # Icon hash (replace if needed)
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
