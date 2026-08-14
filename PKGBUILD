# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="qdl"
pkgname="${_pkgname}-bin"
pkgver=2.8
pkgrel=1
pkgdesc="Tool to communicate with Qualcomm System On a Chip bootroms to install or execute code"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/linux-msm/${_pkgname}"
license=(
  'BSD-3-Clause'
)
depends=(
  'glibc'
  'libusb'
  'libxml2-legacy'
  'libzip'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${url##*/}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_aarch64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}-binary-ubuntu-24-arm64-v${pkgver}.zip"
)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}-binary-ubuntu-24-x64-v${pkgver}.zip"
)
sha256sums=('a5d370f5a145801a5c4b1881c70fd8cf53daa15b1228996862e53ffd30c03d41'
            '85814c88fc75be2523c03551ee2abefc0c30b423edda343197796e0c0e168058')
sha256sums_aarch64=('58b883cc2860643ddc2a059987c1e077737bb56d66230e4dfa9274a165dae92f')
sha256sums_x86_64=('80e2fb22c093ce6641ee0102dd45f5851f4fc65803d0e8d359c4080699e5af6c')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
