# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="figurine"
pkgname="${_pkgname}-bin"
pkgver=2.1.0
pkgrel=1
pkgdesc="Print your text in style"
arch=(
  'aarch64'
  'armv7h'
  'x86_64'
)
url="https://github.com/arsham/${_pkgname}"
license=(
  'Apache-2.0'
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
  "${url}/releases/download/v${pkgver}/${_pkgname}_linux_arm64_v${pkgver}.tar.gz"
)
source_armv7h=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_linux_arm_v${pkgver}.tar.gz"
)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64_v${pkgver}.tar.gz"
)
sha256sums=('1fa417a9f62603dc5b70041d15a3a73cb4301bda6a39c7ddf1905823910a4c85'
            '07944e5d027ada147fa405b891016d1c180a22b7bed0a306a4019157725dac1e')
sha256sums_aarch64=('160b3cbd2c3788e492f6ab60f67a24e3fccce2117a07b0189296997d0e566e2e')
sha256sums_armv7h=('adc23dea214f471ca9e583c3493e9c3396bbc30d6d4049ddeb869e1d22a4dbfe')
sha256sums_x86_64=('2b5d5307f3260ef00b58790015de9c61af61fc5a6ff6bbc173075b5f5bb25adb')

package() {
  cd "${srcdir}"
  install -vDm755 "deploy/${_pkgname}"   "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
