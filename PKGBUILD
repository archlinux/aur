# Maintainer: Parth Bhosle <bhosle6006@gmail.com>
pkgname=documind
pkgver=1.0.0
pkgrel=1
pkgdesc="Gemini-based OCR and Kokoro-based TTS desktop application"
arch=('x86_64')
url="https://github.com/Parth2684/documind-native"
license=('MIT')

depends=(
  'espeak-ng'
  'webkit2gtk-4.1'
  'gtk3'
  'glib2'
  'gdk-pixbuf2'
  'libsoup3'
  'cairo'
  'desktop-file-utils'
  'hicolor-icon-theme'
  'pango'
)
options=('!strip' '!emptydirs' '!debug')
source_x86_64=(
  "documind-${pkgver}.tar.gz::https://github.com/Parth2684/documind-native/releases/download/v${pkgver}/documind-linux-x86_64.tar.gz"
)

sha256sums_x86_64=('61501049a420d2039cca62e6fea72e12b11fd99d3cc18c5b1bb6ad76d4c5ca22')

package() {
    install -Dm755 "$srcdir/documind" "$pkgdir/usr/bin/documind"

    install -Dm644 "$srcdir/documind.desktop" \
    "$pkgdir/usr/share/applications/documind.desktop"

    install -Dm644 "$srcdir/128x128.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/documind.png"

    install -Dm644 "$srcdir/32x32.png" \
      "$pkgdir/usr/share/icons/hicolor/32x32/apps/documind.png"

    install -Dm644 "$srcdir/256x256@2x.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256@2x/apps/documind.png"

  if [ -d "$srcdir/models" ]; then
    install -d "$pkgdir/usr/lib/documind"
    cp -r "$srcdir/models" "$pkgdir/usr/lib/documind/"
  fi
}
