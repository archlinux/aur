# Maintainer: Siddhesh Lakhani <lakhani.siddhesh@gmail.com>
pkgname=glyph-ocr-bin
_pkgname=glyph
pkgver=0.1.1
pkgrel=1
pkgdesc="Blazing-fast, minimal Wayland screen OCR & text sniper (precompiled binary)"
arch=('x86_64')
url="https://github.com/sid-lakhani/glyph"
license=('MIT')
depends=('slurp' 'grim' 'wl-clipboard')
optdepends=(
    'tesseract: Full OCR text recognition'
    'tesseract-data-eng: English OCR language training dataset'
)
provides=('glyph' 'glyph-ocr')
conflicts=('glyph' 'glyph-ocr')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/glyph-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('SKIP')

package() {
    cd "glyph-v$pkgver-x86_64-unknown-linux-gnu"
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}

