# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=go-cpe-dictionary-bin
pkgver=0.10.0
pkgrel=1
pkgdesc="Build a local copy of the CPE dictionary"
arch=('x86_64' 'aarch64')
url="https://github.com/vulsio/go-cpe-dictionary"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/go-cpe-dictionary_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/go-cpe-dictionary_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('d3a2739224bd10058507cdb474309d3e7fe880c479a60c474581f5e1bf32b570')
sha256sums_aarch64=('a107c0c1a5e261ed99cd3cf1dfee52246eeb48cd70b10236a9d6b5081024cb26')

package() {
  install -Dm755 "go-cpe-dictionary" "${pkgdir}/usr/bin/go-cpe-dictionary"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
