# Maintainer: Liam Tölke <liamtoelke@gmail.com>

pkgname=osu-tracker-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Statistics tracker for osu!"
arch=(x86_64)
url="https://github.com/respektive/osu-tracker"
license=("MIT")
depends=(zlib)
provides=(osu-tracker)
conflicts=(osu-tracker)
options=(!strip)
source=(
  "https://github.com/respektive/osu-tracker/releases/download/v$pkgver/osu-tracker-$pkgver.AppImage"
  "https://raw.githubusercontent.com/respektive/osu-tracker/main/public/icon.png"
  "https://raw.githubusercontent.com/respektive/osu-tracker/main/LICENSE.md"
  "osu-tracker.desktop"
  "osu-tracker"
)
noextract=("osu-tracker-$pkgver.AppImage")
sha256sums=('c7842296df294cd07edbae70cb431684040c802bff54f77f52b94408681293f6'
            '5ca041d9863fd0d2bb7c760ea65c4adba76242d221ed042a8d477ab843b94b84'
            '7fbaabf8f0106f727c4ffe508592f0e59fe57c31ca3e5ce9921a32495fa5677e'
            'dbb4a0b56353da6e4d676293e5807ca078b63d919226c2cf03bd3e8f2224feeb'
            '1efce3be9fa30f8a4f74890b1984db77737ce6d939c28ce814758e6496c64bf9')
package() {
  cd "$srcdir"

  # Install binary and launch script
  install -Dm755 "osu-tracker-$pkgver.AppImage" "$pkgdir/opt/osu-tracker/osu-tracker.AppImage"
  install -Dm755 -t "$pkgdir/usr/bin" osu-tracker

  # Install pixmap, desktop and license file
  install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/osu-tracker.png"
  install -Dm644 -t "$pkgdir/usr/share/applications" osu-tracker.desktop
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
