# Maintainer: Kevin <github@kev314.dev>
# Co-Maintainer: Lysec <itslysec@gmail.com>

pkgname=noctalia-shell
pkgver=2.18.2
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
  'power-profiles-daemon: For power profile management'
)

conflicts=('noctalia-shell-git')

source=("git+$url.git#tag=v$pkgver")
sha256sums=('dd1f50d6c165ed8f4926ed48bc99fd7ed8e3e922ad14174c7fb0d41a3a3bc878')

package() {
  cd "$srcdir/$pkgname"

  # Install shell files to quickshell system config directory
  install -dm755 "$pkgdir/etc/xdg/quickshell/noctalia-shell"
  cp -r ./* "$pkgdir/etc/xdg/quickshell/noctalia-shell/"
}
