# Maintainer: RhiobeT (Pierre Jeanjean) <rhiobet@gmail.com>
pkgname=mpv-thumbfast-git
_gitname=thumbfast
pkgver=r128.03e93fe
pkgrel=1
pkgdesc='High-performance on-the-fly thumbnailer for mpv'
arch=(x86_64)
url=https://github.com/po5/thumbfast
license=(MPL-2.0)
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
  install -Dm 644 "LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim: ts=2 sw=2 et:

