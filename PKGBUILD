# Maintainer: John Kinell <johnkinell@gmail.com>

pkgname=unfocol-bin
pkgver=2.0.2
pkgrel=1
pkgdesc="Peripheral-vision focus timer (prebuilt binary)"
arch=('x86_64')
url="https://github.com/MrOnijohn/unfocol"
license=('MIT')
provides=('unfocol')
conflicts=('unfocol')
depends=('libglvnd' 'libxkbcommon' 'libxkbcommon-x11' 'wayland'
         'libx11' 'libxcursor' 'libxi' 'libxrender' 'libxcb')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MrOnijohn/unfocol/releases/download/v$pkgver/unfocol-v$pkgver-x86_64-unknown-linux-gnu.tar.gz"
        "unfocol.desktop"
        "LICENSE"
        "icon-16x16.png"
        "icon-24x24.png"
        "icon-32x32.png"
        "icon-48x48.png"
        "icon-64x64.png"
        "icon-128x128.png"
        "icon-256x256.png"
        "icon-512x512.png")
sha256sums=('ff17237bd23f0d4565ba3b1d3e748b67bee555fe576d6346ff40ed3cc61b895d'
            '470a60dd47b96965a1fee6e7f3436e858d1a5fe3cc930a745be7efef28d9cdaa'
            '51f41edab10fd1e23c6fa4d8b80775be79d2da0b7d5b2d385b084c9ee4fd47b8'
            'd5dab52326d02ebc5a318106908c7457dd8c0dcab0c17885723295b66226f092'
            '77a7f46a30cad130fe7804fb4d3e7b9bd0177176f9fc18398c9a015e00d84864'
            'e75361421d5799cf7e5a675daf3f500104dd556859811141ae0e9fd0a94cb690'
            'b5652994e376fcc6c2e230d403c9cb25de49259c49f2c6195baf8b13522a3392'
            'b8c805587413f22cbd2368e5341a16df82edfb7f8ddcbb7635e8b4a79a9b6cb4'
            '5a30ee8fd846265900320955b28441ca11d16d27b40273af06bccc138d8f0829'
            '7751cc873fd70fcfb39d9f0a625229caae4f7c5d2c208d82cfee1b6e4de64c54'
            'e528024f96e2f9159b4cb1641d16c3d6f5642fe58160e7c6b20a46f47633d52e')

package() {
  install -Dm755 "$srcdir/unfocol" "$pkgdir/usr/bin/unfocol"

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 "$srcdir/unfocol.desktop" \
    "$pkgdir/usr/share/applications/unfocol.desktop"

  for icon in "$srcdir"/icon-*.png; do
    size=$(basename "$icon" | cut -d'-' -f2 | cut -dx -f1)
    install -Dm644 "$icon" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/unfocol.png"
  done
}
