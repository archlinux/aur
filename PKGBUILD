# Maintainer: Kevin <github@kev314.dev>
# Co-Maintainer: Lysec <itslysec@gmail.com>
pkgname=noctalia-shell
pkgver=3.5.0
pkgrel=1
pkgdesc="A sleek and minimal desktop shell thoughtfully crafted for Wayland, built with Quickshell."
arch=('any')
url="https://github.com/noctalia-dev/noctalia-shell"
license=('MIT')
makedepends=('git')
depends=(
  'quickshell'
  'imagemagick'
  'gpu-screen-recorder'
  'brightnessctl'
  'ffmpeg'
  'qt6-multimedia'
)
optdepends=(
  'cliphist: For clipboard history support'
  'matugen: Material You color scheme generation'
  'cava: Audio visualizer component'
  'wlsunset: For supporting NightLight'
  'power-profiles-daemon: For power profile management'
  'ddcutil: For external display brightness control'
)
conflicts=('noctalia-shell-git')
install="${pkgname}.install"
source=("git+$url.git#tag=v$pkgver")
sha256sums=('78b296682d9351c89b447323666a4665fb5b5b2a604ec3676b100df68e3f9337')

package() {
  cd "$srcdir/$pkgname"
  
  install -dm755 "$pkgdir/etc/xdg/quickshell/noctalia-shell"
  cp -r ./* "$pkgdir/etc/xdg/quickshell/noctalia-shell/"
  
  install -Dm644 "Assets/Services/systemd/noctalia.service" \
    "$pkgdir/usr/lib/systemd/user/noctalia.service"
}
