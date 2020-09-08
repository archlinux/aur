# Maintainer: fkxxyz <fkxxyz@163.com>
# Contributer: fkxxyz <fkxxyz@163.com>

pkgname=rockchip-alsa-config
_pkgname=alsa-config
pkgver=20200827
pkgrel=1
pkgdesc="ALSA configs for rockchip."
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/rockchip-linux/alsa-config"
license=('LGPL')
depends=('alsa-utils')
makedepends=('meson')
_commit='16078cdc78d9d4961a60c60c527a1a14972fa30d'
source=(git+https://github.com/rockchip-linux/alsa-config#commit=$_commit)
sha256sums=('SKIP')

build() {
  cd ${_pkgname}
  arch-meson build
  ninja -C build
}

package() {
  cd ${_pkgname}
  DESTDIR=${pkgdir} ninja -C build install
}


