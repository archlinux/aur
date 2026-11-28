# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=algia-bin
pkgver=0.0.141
pkgrel=1
pkgdesc="Command-line client for Nostr"
arch=('x86_64' 'aarch64')
url="https://github.com/mattn/algia"
license=('MIT')
depends=('glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/algia_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/algia_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('1787330c50a7e20e407d26e1dfa7c863d189c594f7a4c6fa9b512cee3474659b')
sha256sums_aarch64=('c337f4d8e93e188d4dba009d3ad29aeb9677c05cafb8799b08a9977b137af2bb')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="algia_v${pkgver}_linux_amd64" ;;
    aarch64) _dir="algia_v${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/algia" "${pkgdir}/usr/bin/algia"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
