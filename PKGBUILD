# Author:   Ishitatsuyuki 
# Packager: Adrian Lopez <zeioth@hotmail.com>
pkgname=latencyflex2-git
_pkgname=latencyflex2
pkgver=1.0.r161.ea41590
pkgrel=1
pkgdesc="Allow you to enable Reflex in compatible games."
arch=(any)
url="https://github.com/Zeioth/LatencyFlex2-installer"
license=('Apache 2.0')
makedepends=(git rustup wine meson mingw-w64 glslang python3)
provides=(latencyflex2-git)
conflicts=(latencyflex2 latencyflex latencyflex-git)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Install
  "${srcdir}"/LatencyFlex2-installer/install.sh
}

uninstall() {
  "${srcdir}"/LatencyFlex2-installer/uninstall.sh
}
