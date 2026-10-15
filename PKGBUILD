# Maintainer: Marcelo Garlet Milani <mgmilani@pm.me>

pkgname=minaw
pkgver=1.9a
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
  'curl: download wallpapers'
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/minaw-$pkgver.tar.gz"
)

sha256sums=('1c54c8336efea30bb6837d1d68a432ea0e2c4e2722cd9f9c0231fb565f5e15f2')

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
  install -Dm644 share/minaw/hourly.fish \
    "$pkgdir/usr/share/minaw/hourly.fish"
  install -Dm644 share/minaw/fortune.fish \
    "$pkgdir/usr/share/minaw/fortune.fish"
  install -Dm755 share/minaw/apod_list \
    "$pkgdir/usr/share/minaw/apod_list"
  install -Dm644 share/minaw/fetch_images.fish \
    "$pkgdir/usr/share/minaw/fetch_images.fish"
  install -Dm755 share/minaw/fetch_aux \
    "$pkgdir/usr/share/minaw/fetch_aux"
  install -Dm755 share/minaw/wallhaven_list \
    "$pkgdir/usr/share/minaw/wallhaven_list"
}
