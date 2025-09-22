# Maintainer: Kevin <github@kev314.dev>
# Co-Maintainer: Lysec <itslysec@gmail.com>

pkgname=noctalia-shell
pkgver=2.13.0
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
  'ddcutil'
)

optdepends=(
  'cliphist: For clipboard history support'
  'matugen-bin: Material You color scheme generation'
  'cava: Audio visualizer component'
  'wlsunset: For supporting NightLight'
)

conflicts=('noctalia-shell-git')

source=("git+$url.git#tag=v$pkgver")
sha256sums=('36eff014e64cea990c6087b9208fc2ce5dd3e9e7805b30db7a8d470700e6bf76')

package() {
  cd "$srcdir/$pkgname"

  # Install shell files to quickshell system config directory
  install -dm755 "$pkgdir/etc/xdg/quickshell/noctalia-shell"
  cp -r ./* "$pkgdir/etc/xdg/quickshell/noctalia-shell/"
}
