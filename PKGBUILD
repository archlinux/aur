# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="figurine"
pkgname="${_pkgname}-bin"
pkgver=2.1.1
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
sha256sums_aarch64=('611550ddb31a75437be3f8587bcdd029d0d890f4d820b7f494a2c6615fecba10')
sha256sums_armv7h=('429e66bded486d49f730c4a6559e728cd1e9a163a0f56a85867e2cbec010171d')
sha256sums_x86_64=('f2b1c076942c94009d133df0f304a234a0994bf590b40f2927668324d578306a')

package() {
  cd "${srcdir}"
  install -vDm755 "deploy/${_pkgname}"   "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
