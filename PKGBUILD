# Maintainer: Kevin <github@kev314.dev>

pkgname=noctalia-shell
pkgver=2.2.2
pkgrel=1
pkgdesc="A sleek and minimal desktop shell thoughtfully crafted for Wayland, built with Quickshell."
arch=('any')
url="https://github.com/noctalia-dev/noctalia-shell"
license=('MIT')
depends=('quickshell' 'ttf-roboto' 'inter-font' 'ttf-material-symbols-variable-git')
optdepends=(
  'cliphist: For clipboard history support'
  'swww: Wallpaper animations and effects'
  'matugen: Material You color scheme generation'
  'cava: Audio visualizer component'
  'gpu-screen-recorder: Screen recording functionality'
  'brightnessctl: For internal/laptop monitor brightness'
  'ddcutil: For desktop monitor brightness'
)
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/noctalia-v${pkgver}.tar.gz")
sha256sums=('99914443fd328a32c407e02e56af6204c8cf6086c121eff6c34fc6a8183ff63a')

package() {
  cd "$srcdir"

  # Install shell files to quickshell system config directory
  install -dm755 "$pkgdir/etc/xdg/quickshell/noctalia"
  cp -r noctalia-release/* "$pkgdir/etc/xdg/quickshell/noctalia/"
}
