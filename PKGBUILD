# Maintainer: RhiobeT (Pierre Jeanjean) <rhiobet@gmail.com>
pkgname=mpv-thumbfast-git
_gitname=thumbfast
pkgver=r124.4241c7d
pkgrel=1
pkgdesc='High-performance on-the-fly thumbnailer for mpv'
arch=(x86_64)
url=https://github.com/po5/thumbfast
license=()
optdepends=('mpv-uosc: for displaying thumbnails automatically on seek')
makedepends=(
  git
)
depends=(
  mpv
)
provides=(mpv-thumbfast)
conflicts=(mpv-thumbfast)
source=(
  thumbfast::git+https://github.com/po5/thumbfast
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
  install -Dm 644 "thumbfast.lua" -t "${pkgdir}/etc/mpv/scripts/"
  install -Dm 644 "thumbfast.conf" -t "${pkgdir}/etc/mpv/script-opts/"
}

# vim: ts=2 sw=2 et:

