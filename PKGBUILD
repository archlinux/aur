# Maintainer: Marcelo Garlet Milani <mgmilani@pm.me>

pkgname=minaw
pkgver=1.6
pkgrel=1
pkgdesc='X11 wallpaper setter with smooth fade transitions'
arch=('any')
url='https://gitlab.com/mgmillani/minaw'
license=('GPL-3.0-only')

depends=(
  'feh'
  'fish'
  'imagemagick'
  'nsxiv'
  'xorg-xprop'
  'xorg-xwininfo'
  'xwinwrap'
  'xorg-xrandr'
)

optdepends=(
  'picom: compositor providing wallpaper opacity transitions'
  'fortune: write a fortune cookie on the wallaper'
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/minaw-$pkgver.tar.gz"
)

sha256sums=('50c334a0c9895778c4f1c0312ec5cdfa0c58dcb3450f5425f72db14dc045dbe1')

package() {
  cd "minaw-$pkgver"

  install -Dm755 minaw \
    "$pkgdir/usr/bin/minaw"
  install -Dm755 minaw-viewer \
    "$pkgdir/usr/lib/minaw/minaw-viewer"
  install -Dm755 minaw-sequencer \
    "$pkgdir/usr/lib/minaw/minaw-sequencer"
  install -Dm755 minaw-utils \
    "$pkgdir/usr/lib/minaw/minaw-utils"
  install -Dm644 config.fish \
    "$pkgdir/usr/share/minaw/config.fish"
  install -Dm644 examples/hourly.fish \
    "$pkgdir/usr/share/minaw/hourly.fish"
  install -Dm644 examples/fortune.fish \
    "$pkgdir/usr/share/minaw/fortune.fish"
  install -Dm644 examples/apod_main.fish \
    "$pkgdir/usr/share/minaw/apod_main.fish"
  install -Dm755 examples/apod_update.fish \
    "$pkgdir/usr/share/minaw/apod_update.fish"
  install -Dm644 examples/fetch_images.fish \
    "$pkgdir/usr/share/minaw/fetch_images.fish"
}
