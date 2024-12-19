# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="kyanos"
pkgname="${_pkgname}-bin"
pkgver=1.4.2
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
b2sums_x86_64=('8b1e31809ef1827b3177752248cca77426c7d1dbc4770283eb6c583ffa5d607661b0ab9af31150827bbd799006d87dc400feb420450d9f497bd0cd3c1c95cb6e')
b2sums_aarch64=('7c2328ed8d8704c0ff39c982a126e639a1213516443fb357912f2ced125e23ba48e0a770bd9db83c1f1d4e604ec938474da7369876ba39e737732d4086c1dcf9')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "README_CN.md" "${pkgdir}/usr/share/doc/${_pkgname}/README_CN.md"
  install -vDm644 "LICENSE"      "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
