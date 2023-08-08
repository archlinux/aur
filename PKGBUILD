# Maintainer: RhiobeT (Pierre Jeanjean) <rhiobet@gmail.com>
pkgname=mpv-uosc-git
_gitname=uosc
pkgver=4.7.0.r46.gbc7b1a1
pkgrel=1
pkgdesc='Feature-rich minimalist proximity-based UI for MPV player'
arch=(x86_64)
url=https://github.com/tomasklaen/uosc
license=(
  GPL3
)
makedepends=(
  git
)
optdepends=('mpv-thumbfast: for showing thumbnails on-the-fly on seek')
provides=(mpv-uosc)
conflicts=(
  mpv-uosc
  'mpv<0.33'
)
source=(
  uosc::git+https://github.com/tomasklaen/uosc.git
)
sha256sums=(
  SKIP
)

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_gitname"
  find script{s,-opts} fonts -type f -exec install -vDm644 {} "${pkgdir}/etc/mpv/{}" \;
}

# vim: ts=2 sw=2 et:

