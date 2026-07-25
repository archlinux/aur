# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: pml68 <contact at pml68 dot dev>

_pkgname=onetalker
pkgname=$_pkgname-bin
pkgver=2026.7
pkgrel=1
pkgdesc='An Augmentative and Alternative Communication (AAC) Aid'
arch=(x86_64)
url='https://onetalker.org'
license=('GPL-3.0-only')
depends=(
  hicolor-icon-theme
  onnxruntime
  protobuf
  alsa-lib
  gcc-libs
  glibc
  bash
)
options=('!lto' '!debug')
provides=("$_pkgname")
conflicts=("$_pkgname")
install="onetalker.install"
source=(
  "https://downloads.onetalker.org/v${pkgver}/OneTalker-${pkgver}-x86_64-no-selfupdate-linux.tar.gz"
  "onetalker.sh"
)
sha256sums=('2c59d259b511d8a7ceb666a2450219037d98d13a2518009135d29906ced80feb'
            '01e25123d26a68289424b1a5640c5d220f1aed8d94c41392f1a2610cac4011f5')

package() {
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/lib/${_pkgname}/${_pkgname}"
  install -Dm755 onetalker.sh "${pkgdir}/usr/bin/${_pkgname}"

  cp -dr share "${pkgdir}/usr"

  mkdir -p "${pkgdir}/usr/share/onetalker"
  cp -dr assets "${pkgdir}/usr/share/onetalker"
}
