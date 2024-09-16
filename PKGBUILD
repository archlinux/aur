# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="gsa"
_pkgname="go-size-analyzer"
pkgname="${_pkgname}-bin"
pkgver=1.7.3
pkgrel=1
pkgdesc="A tool for analyzing the dependencies in compiled Golang binaries"
arch=('x86_64' 'aarch64')
url="https://${_binname}.zxilly.dev"
_url="https://github.com/Zxilly/${_pkgname}"
license=('AGPL-3.0-only')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}_linux_arm64.tar.gz")
b2sums_x86_64=('95dc389072f33dc437f5aae40032d6c18934bb7ee53eb126d0e80c81d19dca9e1a1a937ea91148d43ca6d1e601b4adc2bfcc010cfcefb98518455f53a6e9af02')
b2sums_aarch64=('4b19217b08ad252b67b765e9f9d5d5b4fcdba638f61367bf4c950989ff5426ba288ccc4f5999504e685d606ab339add479cd6343f89ff3a2538a59413b4b3034')

package() {
  cd "${srcdir}"
  install -Dm755 "${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  # install -Dm644 "README_zh_CN.md" "${pkgdir}/usr/share/doc/${_pkgname}/README_zh_CN.md"
  install -Dm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
