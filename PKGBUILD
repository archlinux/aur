# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=go-cve-dictionary-bin
pkgver=0.16.2
pkgrel=1
pkgdesc="Build a local copy of the CVE databases from NVD and JVN"
arch=('x86_64' 'aarch64')
url="https://github.com/vulsio/go-cve-dictionary"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/go-cve-dictionary_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/go-cve-dictionary_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('93c8b2bfb74f9edd855e901ea1b32a8c95d0bc146d6ccad480efa7d7c79bd7cc')
sha256sums_aarch64=('227bb01080312a5a783562eef0e18adccaa7daa22eed495a673760ee99c29cc8')

package() {
  install -Dm755 "go-cve-dictionary" "${pkgdir}/usr/bin/go-cve-dictionary"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
