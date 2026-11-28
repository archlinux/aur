# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tagpr-bin
pkgver=1.22.0
pkgrel=1
pkgdesc="Create release pull requests and tag them when merged"
arch=('x86_64' 'aarch64')
url="https://github.com/Songmu/tagpr"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tagpr_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tagpr_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('65b8f5177055bcee533455153dd8b5521bf233c732f2b2a7176ab7344b31cf21')
sha256sums_aarch64=('3997c5d5d5bff4b9ed2ce82240cef70dc935acf5d44e6a4871f16813fca74fe4')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="tagpr_v${pkgver}_linux_amd64" ;;
    aarch64) _dir="tagpr_v${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/tagpr" "${pkgdir}/usr/bin/tagpr"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
