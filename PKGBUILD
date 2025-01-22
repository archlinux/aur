# Maintainer: IsaacShoebottom (Isaac Shoebottom) <ir.shoebottom@gmail.com>
pkgname=mpv-modernx-git
_gitname=ModernX
pkgver=r328.fcef016
pkgrel=1
pkgdesc='A modern OSC UI replacement for MPV that retains the functionality of the default OSC'
arch=(x86_64)
url=https://github.com/zydezu/ModernX
license=('Unknown')
optdepends=('mpv-thumbfast: For showing thumbnails on the fly')
makedepends=(
  git
)
depends=(
  mpv
)
provides=(mpv-modernx)
conflicts=(mpv-uosc mpv-modernz)
source=(
  ModernX::git+https://github.com/zydezu/ModernX
)
sha256sums=(
  SKIP
)

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm 644 "modernx.lua" -t "${pkgdir}/etc/mpv/scripts/"
  install -Dm 644 "fluent-system-icons.ttf" -t "${pkgdir}/etc/mpv/fonts/"
}
