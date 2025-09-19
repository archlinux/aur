# Maintainer: Kevin <github@kev314.dev>
# Co-Maintainer: Lysec <itslysec@gmail.com>

pkgname=noctalia-shell
pkgver=2.12.1
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
sha256sums=('d9ca3278f6acdd6db7f29420f831fc0f9c60250a578048d608ef7830e5b8c275')

package() {
  cd "$srcdir/$pkgname"

  # Install shell files to quickshell system config directory
  install -dm755 "$pkgdir/etc/xdg/quickshell/noctalia-shell"
  cp -r ./* "$pkgdir/etc/xdg/quickshell/noctalia-shell/"
}
