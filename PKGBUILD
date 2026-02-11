# Maintainer: Kevin <github@kev314.dev>
# Co-Maintainer: Lysec <itslysec@gmail.com>
pkgname=noctalia-shell
pkgver=4.4.2
pkgrel=1
pkgdesc="A sleek and minimal desktop shell thoughtfully crafted for Wayland, built with Quickshell."
arch=('any')
url="https://github.com/noctalia-dev/noctalia-shell"
license=('MIT')
makedepends=('git')
depends=(
  'quickshell'
  'imagemagick'
  'brightnessctl'
  'ffmpeg'
  'qt6-multimedia'
  'python'
)
optdepends=(
  'cliphist: For clipboard history support'
  'cava: Audio visualizer component'
  'wlsunset: For supporting NightLight'
  'power-profiles-daemon: For power profile management'
  'ddcutil: For external display brightness control'
)
conflicts=('noctalia-shell-git')
install="${pkgname}.install"
source=("git+$url.git#tag=v$pkgver")
sha256sums=('c84add538d6e82637861373b3b19c928253031bfa69c130f5fa710ef95b6649f')

package() {
  cd "$srcdir/$pkgname"
  
  install -dm755 "$pkgdir/etc/xdg/quickshell/noctalia-shell"
  cp -r ./* "$pkgdir/etc/xdg/quickshell/noctalia-shell/"
  
  install -Dm644 "Assets/Services/systemd/noctalia.service" \
    "$pkgdir/usr/lib/systemd/user/noctalia.service"
}
