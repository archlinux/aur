# Maintainer: IsaacShoebottom (Isaac Shoebottom) <ir.shoebottom@gmail.com>
pkgname=mpv-modernz-git
_gitname=ModernZ
pkgver=r859.488854b
pkgrel=1
pkgdesc='A sleek and modern OSC for mpv designed to enhance functionality by adding more features, all while preserving the core standards of the main mpv OSC'
arch=(x86_64)
url=https://github.com/Samillion/ModernZ
license=(LGPL-2.1-only)
optdepends=('mpv-thumbfast: For showing thumbnails on the fly')
makedepends=(
  git
)
depends=(
  mpv
)
provides=(mpv-modernz)
conflicts=(mpv-uosc mpv-modernx)
source=(
  ModernZ::git+https://github.com/Samillion/ModernZ
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
  install -Dm 644 "modernz.lua" -t "${pkgdir}/etc/mpv/scripts/"
  install -Dm 644 "modernz.conf" -t "${pkgdir}/etc/mpv/script-opts/"
  install -Dm 644 "fluent-system-icons.ttf" -t "${pkgdir}/etc/mpv/fonts/"
}
