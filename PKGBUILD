# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sayna-bin
pkgver=0.1.16
pkgrel=1
pkgdesc="Unified voice layer for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/SaynaAI/sayna"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'libstdc++' 'libx11')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/sayna-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/sayna-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('e959d8ef79d8f1e2018ad06d7637fc50b3480a6e951de80fc0851b72ad8de2e5')
sha256sums_aarch64=('aa9d3d276ed26976fae5e870918e5d04cbf91a964037c46c1f83e9b6902d7391')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="sayna-${pkgver}-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="sayna-${pkgver}-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/sayna" "${pkgdir}/usr/bin/sayna"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
