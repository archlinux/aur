# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: pml68 <contact at pml68 dot dev>

_pkgname=onetalker
pkgname=$_pkgname-bin
pkgver=2026.2
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
source=(
  "https://downloads.onetalker.org/v${pkgver}/OneTalker-${pkgver}-x86_64-linux.tar.gz"
  "onetalker.sh"
)
sha256sums=('36d71564043dcaff3c4508d39ddb0b0f93109e78d69f8d79edbd1f12f5034af4'
            'd568614f8a667d67e59dddab079d24ca988632f739c5e98c2f539e4a1c540a24')

package() {
  install -Dm755 "${_pkgname}" "${pkgdir}/opt/${_pkgname}/${_pkgname}"
  install -Dm755 onetalker.sh "${pkgdir}/usr/bin/${_pkgname}"

  cp -dr share "${pkgdir}/usr"

  mkdir -p "${pkgdir}/usr/share/onetalker"
  cp -dr assets "${pkgdir}/usr/share/onetalker"
}
