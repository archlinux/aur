# Maintainer: Ash <xash at riseup d0t net>
pkgname="mpv-reload-git"
pkgver=r16.1a6a938
pkgrel=1
pkgdesc="A userscript for MPV that provides automatic reloading of videos based on buffering progress and allows manual reload with Ctrl+r."
arch=('any')
url="https://github.com/4e6/mpv-reload"
license=('MIT')
depends=('mpv')
makedepends=('git')
provides=('mpv-reload')
conflicts=('mpv-reload')
source=("git+https://github.com/4e6/mpv-reload.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/mpv-reload"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/mpv-reload"
  
  # Install reload.lua script
  install -Dm 644 "reload.lua" "$pkgdir/etc/mpv/scripts/reload.lua"
  
  # Install LICENSE
  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
