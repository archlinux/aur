# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="gsa"
_pkgname="go-size-analyzer"
pkgname="${_pkgname}-bin"
pkgver=1.6.2
pkgrel=1
pkgdesc="A tool for analyzing the size of compiled Go binaries"
arch=('x86_64' 'aarch64')
url="https://${_binname}.zxilly.dev"
_url="https://github.com/Zxilly/${_pkgname}"
license=('AGPL-3.0-or-later')
provides=("${_pkgname}" "${_binname}")
conflicts=("${_pkgname}" "${_binname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}_linux_arm64.tar.gz")
sha256sums_x86_64=('29e465b472160fe2dccb4d4972cfd182b86969d05148c974ecdad7c20bbf9925')
sha256sums_aarch64=('90b6f1d0a9c15746a185a6d15ae3d2233181d74629da1834c56bf6cdf5b6a724')

package() {
  cd "${srcdir}"
  install -Dm755 "${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  # install -Dm644 "README_zh_CN.md" "${pkgdir}/usr/share/doc/${_pkgname}/README_zh_CN.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
