# Maintainer: Kevin <github@kev314.dev>
# Co-Maintainer: Lysec <itslysec@gmail.com>
pkgname=noctalia-shell
pkgver=3.7.1
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
sha256sums=('e961085937a05057228a8a22b7ed6abe8a8d38b864866192bc49ed72350fd0da')

package() {
  cd "$srcdir/$pkgname"
  
  install -dm755 "$pkgdir/etc/xdg/quickshell/noctalia-shell"
  cp -r ./* "$pkgdir/etc/xdg/quickshell/noctalia-shell/"
  
  install -Dm644 "Assets/Services/systemd/noctalia.service" \
    "$pkgdir/usr/lib/systemd/user/noctalia.service"
}
