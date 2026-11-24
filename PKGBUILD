# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=hcom-bin
pkgver=0.7.31
pkgrel=1
pkgdesc="Let AI agents message, watch and spawn each other across terminals"
arch=('x86_64' 'aarch64')
url="https://github.com/aannoo/hcom"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/hcom-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/hcom-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('ba0348fa87d9f56b4e904f249f1a2b4bbd9501d82e4431530660245c09d3f2bc')
sha256sums_aarch64=('e28cab039a3351a115ad1126f3c98f2d81966b24ac7a72436eec4faa4775c2c4')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="hcom-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="hcom-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/hcom" "${pkgdir}/usr/bin/hcom"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
