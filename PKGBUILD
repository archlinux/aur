# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=ztd-git
pkgver=r518.cfe0db7
pkgrel=1
pkgdesc="thermitegod spacefm dependency"
arch=(any)
url="https://github.com/thermitegod/ztd"
license=(GPL-3.0-or-later)
#depends=(openssl)
makedepends=(git meson ninja)
provides=(ztd)
conflicts=(ztd)
source=("git+https://github.com/thermitegod/ztd.git")
sha256sums=('SKIP')

pkgver() {
  cd ztd
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ztd
  arch-meson build
  ninja -C build
}

package() {
  cd ztd
  DESTDIR="${pkgdir}" ninja -C build install
}
