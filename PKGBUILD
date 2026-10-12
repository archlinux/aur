# Maintainer: shadwoash8 <shadowash8 at protonmail dot com>

pkgname=nauka

pkgver=0.1.0
pkgrel=1
pkgdesc="a minimal wayland compositor with various layouts, animations and all the eye-candy"
arch=('x86_64')
url="https://github.com/shadowash8/nauka"
license=('GPLV3')
depends=(
  'wayland'
  'libinput'
  'libdrm'
  'pixman'
  'libxkbcommon'
  'wlroots0.20'
  'scenefx=0.5'
)
makedepends=(
  'git'
  'meson'
  'ninja'
  'wayland-protocols'
)
provides=('nauka' 'wayland-compositor')
conflicts=('nauka-git' 'nauka-git-debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('361c1e1f807c133c5f9923646f5403f0ee3880f4e913507f96500dc099626e58')

build() {
  arch-meson "${srcdir}/${pkgname}-${pkgver}" build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
