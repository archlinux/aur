# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=greeg-bin
pkgver=0.14.1
pkgrel=1
pkgdesc="Indexed, ripgrep-compatible code search for AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/thiagodmont/greeg"
license=('MIT')
depends=('glibc' 'libgcc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/greeg-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/greeg-${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('b748aed53acd07e03e2f6b29c7eb9bdd9dabc386391d27a5caf96e9a63152c42')
sha256sums_aarch64=('be77f6d7c4a4c9d8aef3c7676ab85c05176b612227a25e5cd1e9587e5cea55ab')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="greeg-${pkgver}-x86_64-unknown-linux-gnu" ;;
    aarch64) _dir="greeg-${pkgver}-aarch64-unknown-linux-gnu" ;;
  esac
  install -Dm755 "${_dir}/greeg" "${pkgdir}/usr/bin/greeg"
  install -Dm644 "${_dir}/LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
