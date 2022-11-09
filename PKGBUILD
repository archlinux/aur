# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=vkbasalt-cli
pkgver=3.0
pkgrel=1
pkgdesc="Command-line utility for vkBasalt"
arch=(any)
url="https://gitlab.com/TheEvilSkeleton/vkbasalt-cli"
license=(LGPL3)
depends=(python)
makedepends=(git meson)
source=("git+https://gitlab.com/TheEvilSkeleton/vkbasalt-cli.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd vkbasalt-cli
  meson --prefix=/usr build
  ninja -C build
}

package() {
  cd vkbasalt-cli
  DESTDIR="${pkgdir}" ninja -C build install
}
