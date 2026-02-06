# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="qdl"
pkgname="${_pkgname}-bin"
pkgver=2.4
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
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_aarch64=(
  "${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-binary-ubuntu-24-arm64.zip"
)
source_x86_64=(
  "${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-binary-ubuntu-24-x64.zip"
)
sha256sums=('97072d5a3e790a46f1a71f0cdf6955a704491756b210ede4c9d26651bd34a5a9'
            '85814c88fc75be2523c03551ee2abefc0c30b423edda343197796e0c0e168058')
sha256sums_aarch64=('7580fa7d9d7fa3ebc887628467a882e793ffa3301ebc4588a239678266ddb90a')
sha256sums_x86_64=('19e8380067ca36264b2a7fe18e0464ab0a59e3c48f2b61443a25a449c87b5f72')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
