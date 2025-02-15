# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_binname="gsa"
_pkgname="go-size-analyzer"
pkgname="${_pkgname}-bin"
pkgver=1.7.7
pkgrel=1
pkgdesc="A tool for analyzing the dependencies in compiled Golang binaries"
arch=('aarch64' 'x86_64')
url="https://${_binname}.zxilly.dev"
_url="https://github.com/Zxilly/${_pkgname}"
license=('AGPL-3.0-only')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}_linux_arm64.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64.tar.gz")
b2sums_aarch64=('021d4cba17102ab79a466c5c560a2de2b45eb0409fe12215fad7e339d28b81750add5b032fb645b4630fe0349071d697ba3e5a11acd8377b6f7f2de7a65aae01')
b2sums_x86_64=('c81c43e707404caabf52c09e48826de916c44052a249f9f6bccdc27635bef139d655f22b2b7b4b150a94f0f7fbf409bb6d739e7d107c3819010bce59552e3ba8')

package() {
  cd "${srcdir}"
  install -vDm755 "${_binname}" "${pkgdir}/usr/bin/${_binname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  # install -vDm644 "README_zh_CN.md" "${pkgdir}/usr/share/doc/${_pkgname}/README_zh_CN.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
