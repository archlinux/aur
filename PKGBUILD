# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="qdl"
pkgname="${_pkgname}-bin"
pkgver=2.6_31
_pkgver="${pkgver//_/-}"
pkgrel=1
pkgdesc="Tool to communicate with Qualcomm System On a Chip bootroms to install or execute code"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'x86_64'
)
url="https://github.com/linux-msm/${_pkgname}"
_url="https://github.com/arduino/qdl-packing"
license=(
  'BSD-3-Clause'
)
depends=(
  'glibc'
  # 'libusb'
  # 'libxml2-legacy'
)
provides=(
  "${_pkgname}=${pkgver%_*}"
)
conflicts=(
  "${_pkgname}"
)
# _pkgsrc="${_pkgname}-${pkgver}"
# source=(
#   "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
#   "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
# )
source_aarch64=(
  # "${_pkgsrc}-binary-ubuntu-24-arm64.zip::${url}/releases/download/v${pkgver}/${_pkgname}-binary-ubuntu-24-arm64.zip"
  "${_url}/releases/download/v${_pkgver}/${_pkgname}_v${_pkgver}_Linux_ARM64.tar.gz"
)
source_armv7h=(
  "${_url}/releases/download/v${_pkgver}/${_pkgname}_v${_pkgver}_Linux_ARMv6.tar.gz"
)
source_i686=(
  "${_url}/releases/download/v${_pkgver}/${_pkgname}_v${_pkgver}_Linux_32bit.tar.gz"
)
source_x86_64=(
  "${_url}/releases/download/v${_pkgver}/${_pkgname}_v${_pkgver}_Linux_64bit.tar.gz"
  # "${_pkgsrc}-binary-ubuntu-24-x64.zip::${url}/releases/download/v${pkgver}/${_pkgname}-binary-ubuntu-24-x64.zip"
)
sha256sums_aarch64=('777d48162663dc09df0511485fcd7ac099d0235569a48d5f34f993360eb3a67a')
sha256sums_armv7h=('c6c84101cd43ecfaf2f7c66f88cd854110de4f1f3aba549fd34f22fbc833828a')
sha256sums_i686=('e7182ea9fa8bebda3dbaba03719ecd8928ca85cd27dbd7af325aa76026e27533')
sha256sums_x86_64=('32d9378b9d7e8c583d8ffcae80982eb4486b54352c1e728024973796d99843b0')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  # install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  # install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
