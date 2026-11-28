# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=doc7-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="Turn documents into AI-ready Markdown with visual understanding"
arch=('x86_64' 'aarch64')
url="https://github.com/magicrew/doc7"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/doc7_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/doc7_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('2eb595ed2b085ab780888a5de2a2a038744d05a3e7cd53a4a4ccf490e0a97784')
sha256sums_aarch64=('e53b580983c29a524b3682b7c06462d30534135a65cde0fd06a870a4cc11b7e5')

package() {
  local _dir
  case $CARCH in
    x86_64) _dir="doc7_v${pkgver}_linux_amd64" ;;
    aarch64) _dir="doc7_v${pkgver}_linux_arm64" ;;
  esac
  install -Dm755 "${_dir}/doc7" "${pkgdir}/usr/bin/doc7"
  install -Dm644 "${_dir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
