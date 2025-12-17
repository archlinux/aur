# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pixelflasher-bin
pkgver=8.13.0.0
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
sha256sums=('2e827cb486900e5149a8e78a611a77c9eae26d756d7a383aeec0ddf586283a7d'
            '32d3cd1ee316e6edae31eabf8335d7ed29445e1ff9b842c77060f900037f867c'
            'dbb31a1b359bdda2d6501ccf5d80fb888508619da948c3f98d4b0cb74f907615')

package() {
  install -Dm755 PixelFlasher-$pkgver "$pkgdir/usr/bin/PixelFlasher"
  install -Dm644 icon-dark-256.png "$pkgdir/usr/share/pixmaps/pixelflasher.png"
  install -Dm644 PixelFlasher.desktop -t "$pkgdir/usr/share/applications/"
}
