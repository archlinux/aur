# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="gsa"
_pkgname="go-size-analyzer"
pkgname="${_pkgname}-bin"
pkgver=1.7.4
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
b2sums_x86_64=('86fbd062e9d5b5a2398edbbf636ed9753cb73f2cd4f2362c5729a2679986365634edce9db9a441b657f7bb15735e169d4b25dbc77f76b6cea9067f223efab554')
b2sums_aarch64=('055dc42d24837ec9c722bf88ca6a4e10544e09b8c14aecc471cba24c7cd565b768bb6e175fa4a9adaf665c0d50b89e83d43178203fb3d0e0e727552383310256')

package() {
  cd "${srcdir}"
  install -Dm755 "${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  # install -Dm644 "README_zh_CN.md" "${pkgdir}/usr/share/doc/${_pkgname}/README_zh_CN.md"
  install -Dm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
