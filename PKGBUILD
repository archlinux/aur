# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=go-tpm-tools-bin
pkgver=0.4.11
pkgrel=1
pkgdesc="Command-line tool for working with TPMs"
arch=('x86_64' 'aarch64')
url="https://github.com/google/go-tpm-tools"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/go-tpm-tools_Linux_x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/go-tpm-tools_Linux_arm64.tar.gz")
sha256sums_x86_64=('050e189bd17b7198d68c3586670cb479aaa26181dd590786ba700ba3bdcb7d9e')
sha256sums_aarch64=('69df0f46a8abfa617491e4b4d2eb2a460548776e2aa5fb98bda2027daaba8861')

package() {
  install -Dm755 "gotpm" "${pkgdir}/usr/bin/gotpm"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
