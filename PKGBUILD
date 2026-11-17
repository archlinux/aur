# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgbase=nordwand-mono
pkgname=('ttf-nordwand-mono' 'otf-nordwand-mono')
pkgver=1.6.0
pkgrel=1
pkgdesc="Compact monospace neo-grotesque font designed for developers"
arch=('any')
url="https://github.com/tywr/Nordwand-Mono"
license=('OFL-1.1')
depends=('fontconfig')
install=nordwand-mono.install

source=(
  "NordwandMono-TTF-$pkgver.zip::$url/releases/download/$pkgver/NordwandMono-TTF.zip"
  "NordwandMono-OTF-$pkgver.zip::$url/releases/download/$pkgver/NordwandMono-OTF.zip"
  "LICENSE-FONT-$pkgver.txt::https://raw.githubusercontent.com/tywr/Nordwand-Mono/$pkgver/LICENSE-FONT.txt"
)
sha256sums=('0ffbee5520ac436cba7cd7971c3d2d83ab6f52f3d61ae0da1fc0293c5428ae2b'
            '5bf51d39735322dbf1bfe545cd288d47f72ed19017dc1de00fab6205ce8afa04'
            'e0e493edae714ad5bb243a346f3fd45ecdd94a00584118297f2d05e0f6187d38')

package_ttf-nordwand-mono() {
  install -Dm644 "$srcdir"/*.ttf -t "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 "$srcdir/LICENSE-FONT-$pkgver.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-FONT.txt"
}

package_otf-nordwand-mono() {
  install -Dm644 "$srcdir"/*.otf -t "$pkgdir/usr/share/fonts/OTF"
  install -Dm644 "$srcdir/LICENSE-FONT-$pkgver.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-FONT.txt"
}
