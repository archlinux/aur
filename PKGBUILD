# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pixelflasher-bin
pkgver=8.14.0.1
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
sha256sums=('8f8928b0dc70a419261c6146d0cfba94ea218eb9487f8e31efc75586f12849a9'
            '32d3cd1ee316e6edae31eabf8335d7ed29445e1ff9b842c77060f900037f867c'
            'dbb31a1b359bdda2d6501ccf5d80fb888508619da948c3f98d4b0cb74f907615')

package() {
  install -Dm755 PixelFlasher-$pkgver "$pkgdir/usr/bin/PixelFlasher"
  install -Dm644 icon-dark-256.png "$pkgdir/usr/share/pixmaps/pixelflasher.png"
  install -Dm644 PixelFlasher.desktop -t "$pkgdir/usr/share/applications/"
}
