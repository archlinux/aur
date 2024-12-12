# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="kyanos"
pkgname="${_pkgname}-bin"
pkgver=1.4.1
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
b2sums_x86_64=('f19719de8eac64f8b641107cad2f13564386ce3bef5304aac4649eacc56a7797d46315c73575d606f41b78442445d6621e0a47b5487c86f65c674493e4c7e85b')
b2sums_aarch64=('10905ba45305851be97c855b7d07891061dd563bd062dafc673fc42d951f0cf9e27ed7b8d28c7b5176e516fef291b000d69c2a956f5a256e2bcfa7b87f5b71be')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "README_CN.md" "${pkgdir}/usr/share/doc/${_pkgname}/README_CN.md"
  install -vDm644 "LICENSE"      "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
