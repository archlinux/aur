# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=oxicloud-bin
pkgver=0.10.1
pkgrel=1
pkgdesc="Ultra-fast, secure & lightweight self-hosted cloud storage your files, photos, calendars & contacts, all in one place"
arch=('x86_64' 'aarch64')
url="https://github.com/AtalayaLabs/OxiCloud"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/oxicloud-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/oxicloud-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('d1f53e1fb2afd00606fc3940fe82eee04886bfbf87d0d4bc820d955fc55a49cc')
sha256sums_aarch64=('b460f75c590dc9bbe789b3b64ef8167607a24ec38250ea908a6f914d45ee85b0')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="oxicloud-${pkgver}-x86_64-unknown-linux-musl" ;;
    aarch64) _dir="oxicloud-${pkgver}-aarch64-unknown-linux-musl" ;;
  esac
  install -Dm755 "${_dir}/oxicloud" "${pkgdir}/usr/bin/oxicloud"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
