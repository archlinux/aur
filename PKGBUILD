# Maintainer: Kevin <github@kev314.dev>
# Co-Maintainer: Lysec <itslysec@gmail.com>
pkgname=noctalia-shell
pkgver=3.0.10
pkgrel=1
pkgdesc="A sleek and minimal desktop shell thoughtfully crafted for Wayland, built with Quickshell."
arch=('any')
url="https://github.com/noctalia-dev/noctalia-shell"
license=('MIT')
depends=(
  'quickshell'
  'ttf-roboto'
  'inter-font'
  'gpu-screen-recorder'
  'brightnessctl'
)
optdepends=(
  'cliphist: For clipboard history support'
  'matugen-bin: Material You color scheme generation'
  'cava: Audio visualizer component'
  'wlsunset: For supporting NightLight'
  'power-profiles-daemon: For power profile management'
  'ddcutil: For external display brightness control'
)
conflicts=('noctalia-shell-git')
install="${pkgname}.install"
source=("git+$url.git#tag=v$pkgver")
sha256sums=('3a3bfc1d0b0f6a6959cd895c84831443175b086ed90b997d8985dd9009bdc68b')

package() {
  cd "$srcdir/$pkgname"
  
  install -dm755 "$pkgdir/etc/xdg/quickshell/noctalia-shell"
  cp -r ./* "$pkgdir/etc/xdg/quickshell/noctalia-shell/"
  
  install -Dm644 "Assets/Services/systemd/noctalia.service" \
    "$pkgdir/usr/lib/systemd/user/noctalia.service"
}
