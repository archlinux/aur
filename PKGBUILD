# Maintainer: Mogeko <zhengjunyi@live.com>

pkgname=mpv-assrt-git
_pkgname=${pkgname%-git}
pkgver=r22.e12edf5
pkgrel=1
pkgdesc="Automatically download subtitles from assrt.net for mpv player."
arch=(any)
url="https://github.com/AssrtOSS/mpv-assrt"
license=("unknown")
depends=("mpv")
provides=("mpv-assrt")
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"/scripts
  install -Dm644 -t "$pkgdir"/usr/share/mpv/scripts assrt.lua
  install -Dm644 -t "$pkgdir"/usr/share/mpv/scripts/modules modules/*.lua
}
