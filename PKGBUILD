# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="kyanos"
pkgname="${_pkgname}-bin"
pkgver=1.4.0
pkgrel=1
pkgdesc="Visualize the time packets spend in the kernel, watch & analyze in command line"
arch=('x86_64' 'aarch64')
url="https://kyanos.io"
_url="https://github.com/hengyoush/${_pkgname}"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.tar.gz")
b2sums_x86_64=('4b2353edabc83b37fe394989253788c5a5e7d7aca2585b346e4df295e8c9cd7c30684dcc1741352f5f6bfea0b0781c5eedacc36d3525e746e4d7bdc4e296ce5c')
b2sums_aarch64=('bad850940cf5283c8561a7d923f22dd570e77c6c207de773f8f895609082c9524041f543b957dff693c6bebed9d4369f026cf9105d5537e70ad83c302bf96aa2')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "README_CN.md" "${pkgdir}/usr/share/doc/${_pkgname}/README_CN.md"
  install -vDm644 "LICENSE"      "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
