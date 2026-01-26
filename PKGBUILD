# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="wipemychat"
pkgname="${_pkgname}-bin"
pkgver=1.2.4
pkgrel=1
pkgdesc="Delete all your messages in public and private Telegram chats"
arch=(
  'aarch64'
  'i686'
  'x86_64'
)
url="https://github.com/rusq/${_pkgname}"
license=(
  'GPL-3.0-only'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENCE"
)
source_aarch64=(
  "${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz"
)
source_i686=(
  "${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz"
)
source_x86_64=(
  "${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz"
)
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_aarch64=('1bffa4f6e23b436796dd5baa98da75ab5e0eef3258f06a337c4754d8d4d26492')
sha256sums_i686=('9e75b0381b905502b3c4b74a5ec238e4f08c9244217ba5afffebc401619efc11')
sha256sums_x86_64=('0b4accaa0f06ed11f260cb2ab7a2b2e02f608c35ddffac23b5474092043d4975')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
