# Maintainer: Kevin <github@kev314.dev>

pkgname=noctalia-shell
pkgver=2.2.4
pkgrel=1
pkgdesc="A sleek and minimal desktop shell thoughtfully crafted for Wayland, built with Quickshell."
arch=('any')
url="https://github.com/noctalia-dev/noctalia-shell"
license=('MIT')
install=noctalia-shell.install
depends=('quickshell' 'ttf-roboto' 'inter-font' 'ttf-material-symbols-variable-git')
optdepends=(
  'cliphist: For clipboard history support'
  'swww: Wallpaper animations and effects'
  'matugen-bin: Material You color scheme generation'
  'cava: Audio visualizer component'
  'gpu-screen-recorder: Screen recording functionality'
  'brightnessctl: For internal/laptop monitor brightness'
  'ddcutil: For desktop monitor brightness'
)
source=("git+$url.git#tag=v$pkgver")
sha256sums=('ddbcc29e79472149c58a9613fb906e1dbf10652670db5645ce7f74c86b741c06')

package() {
  cd "$srcdir/$pkgname"

  # Install shell files to quickshell system config directory
  install -dm755 "$pkgdir/etc/xdg/quickshell/noctalia"
  cp -r ./* "$pkgdir/etc/xdg/quickshell/noctalia/"
}
