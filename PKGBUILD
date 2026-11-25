# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=gopy-bin
pkgver=0.6.0
pkgrel=1
pkgdesc="gopy generates a CPython extension module from a go package"
arch=('x86_64' 'aarch64')
url="https://github.com/go-python/gopy"
license=('BSD-3-Clause')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/gopy_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/gopy_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('fb5d3fd639d4290f89922ed06acdf51fce405ffc73ca93706fbf6b931fa92aba')
sha256sums_aarch64=('36658281e17fba61becb06477863aeb1d31ad9daa791bb92099c72c261951cdd')

package() {
  install -Dm755 "gopy" "${pkgdir}/usr/bin/gopy"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
