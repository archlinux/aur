# Maintainer: Kevin <github@kev314.dev>
# Co-Maintainer: Lysec <itslysec@gmail.com>
pkgname=noctalia-shell
pkgver=4.7.7
pkgrel=3
pkgdesc="A sleek and minimal desktop shell thoughtfully crafted for Wayland, built with Quickshell."
arch=('any')
url="https://github.com/noctalia-dev/noctalia"
license=('MIT')
makedepends=('git')
depends=(
  'noctalia-qs'
  'imagemagick'
  'brightnessctl'
  'ffmpeg'
  'qt6-multimedia'
  'python'
  'wlr-randr'
)
optdepends=(
  'cliphist: For clipboard history support'
  'wlsunset: For supporting NightLight'
  'power-profiles-daemon: For power profile management'
  'ddcutil: For external display brightness control'
)
conflicts=('noctalia-shell-git')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('4278695c45dc2c45d17ea75247713c5bc0ad86ac67daf7cb36819422c0db4df6')

package() {
  cd "$srcdir/noctalia"
  
  install -dm755 "$pkgdir/etc/xdg/quickshell/noctalia-shell"
  cp -r ./* "$pkgdir/etc/xdg/quickshell/noctalia-shell/"
}
