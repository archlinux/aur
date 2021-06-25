pkgname=mpv-visualizer-git
_pkgname=${pkgname%-git}
pkgver=r18.a0cd87e
pkgrel=1
pkgdesc="various audio visualization."
arch=('any')
url="https://github.com/mfcc64/mpv-scripts"
depends=('mpv')
makedepends=('git')
provides=('mpv-visualizer')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  install -Dm 755 visualizer.lua "$pkgdir/usr/share/mpv/scripts/visualizer.lua"
}
