# Maintainer: Marcelo Garlet Milani <mgmilani@pm.me>

pkgname=minaw
pkgver=1.7
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

sha256sums=('57555cd460a8f30baf5608335f2f4d3a087e98a3ce4c83694c839817a6df2be6')

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
