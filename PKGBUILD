# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gpt-image-2-skill-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="CLI, web and desktop client for GPT Image 2"
arch=('x86_64' 'aarch64')
url="https://github.com/Wangnov/gpt-image-2-skill"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/gpt-image-2-skill-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/gpt-image-2-skill-aarch64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('8e72ae202b1d22b78804be26172fb9b012858c511ed9278f16783a14ee482e8a')
sha256sums_aarch64=('b9f140be93c526b081c8cbd5d7694c1da14247925979011df33920c6264f7221')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="gpt-image-2-skill-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="gpt-image-2-skill-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/gpt-image-2-skill" "${pkgdir}/usr/bin/gpt-image-2-skill"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
