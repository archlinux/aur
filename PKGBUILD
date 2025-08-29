# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=pixelflasher-bin
pkgver=8.5.1.0
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
        'PixelFlasher.desktop'
        'PixelFlasher.png')
sha256sums=('abc41fa38c3bcc169cc629b9a2a8c87d5b3cb6b1b34a5d1f8746176e1f2a96c0'
            '3f503e3e3b819562669e1d0a8a25043c478c8c1709b376642fd678caf3d8ee34'
            '5b3636592d9c437e5ffca64382ac969cb6b35cc8675c7e3e464b56e4c068d199')

package() {
  install -Dm755 PixelFlasher-$pkgver "$pkgdir/usr/bin/PixelFlasher"
  install -Dm644 PixelFlasher.png -t "$pkgdir/usr/share/pixmaps/"
  install -Dm644 PixelFlasher.desktop -t "$pkgdir/usr/share/applications/"
}
