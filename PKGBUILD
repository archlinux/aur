# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="gotz"
pkgname="${_pkgname}-bin"
pkgver=0.1.12
pkgrel=1
pkgdesc="A simple CLI timezone info tool"
arch=('aarch64' 'armv6h' 'i686' 'x86_64')
url="https://github.com/merschformann/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.tar.gz")
source_armv6h=("${_pkgsrc}-armv6h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_armv6.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_386.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.tar.gz")
sha256sums_aarch64=('21b81689c7ae1e4864c2ce93876213cabe9551e4791e795054fa209c06b37c6f')
sha256sums_armv6h=('29ddac66d7dadc186bfa559b051d1ee31fccd701091b2d24b0f5a1c144743119')
sha256sums_i686=('157464cb1d6b837680f16fe2a7b4a08d3451e35afae37947674aa8ef7c3a55c1')
sha256sums_x86_64=('b1f4fd84d65e2bbdbaeb0c7ca183b73d2f909fb7c651cf4070ab89924a6a5d9c')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
