# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pixelflasher-bin
pkgver=10.1.1.1
pkgrel=1
pkgdesc="Pixel phone flashing GUI utility with features."
arch=('x86_64')
url="https://github.com/badabing2005/PixelFlasher"
license=('GPL-3.0-or-later')
depends=(
  'glibc'
  'xdg-utils'
  'zlib'
)
optdepends=(
  'android-tools: Use system platform tools'
  'libnotify: Display system toast notifications'
  'scrcpy: Launch Screen Copy'
)
provides=('pixelflasher')
conflicts=('pixelflasher')
options=('!strip')
source=("PixelFlasher-$pkgver::$url/releases/download/v$pkgver/PixelFlasher_Ubuntu_24_04"
        "https://raw.githubusercontent.com/badabing2005/PixelFlasher/v$pkgver/images/icon-dark-256.png"
        'PixelFlasher.desktop')
sha256sums=('7d7340b82dcd68685966dc7139f91063b589ccc38708866395e7262456f1ff33'
            '32d3cd1ee316e6edae31eabf8335d7ed29445e1ff9b842c77060f900037f867c'
            'cd96ad8759d7cb5b530aa7b542b422be5f08d92ad92f28fcdf8413d3015dc7cb')

package() {
  install -Dm755 PixelFlasher-$pkgver "$pkgdir/usr/bin/PixelFlasher"
  install -Dm644 icon-dark-256.png "$pkgdir/usr/share/pixmaps/pixelflasher.png"
  install -Dm644 PixelFlasher.desktop -t "$pkgdir/usr/share/applications/"
}
