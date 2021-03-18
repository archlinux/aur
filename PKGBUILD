# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=echfs-git
pkgver=0.0
pkgrel=1
pkgdesc="Utilities for manipulating echfs filesystems"
arch=("i686" "x86_64")
url="https://github.com/echfs/echfs"
license=("BSD")
depends=(fuse util-linux pkgconf)
source=(${url}/archive/master.tar.gz)
sha256sums=('SKIP')
_dir="echfs-master"

build() {
  make -C "${_dir}"
}

package() {
  make -C "${_dir}" PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 "${_dir}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
