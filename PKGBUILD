# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="wipemychat"
pkgname="${_pkgname}-bin"
pkgver=1.2.5
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
sha256sums_aarch64=('9481b9506a3237d2c4192f0a11713bca04824001bdd35a5ce3fb1a882da5e4f4')
sha256sums_i686=('ec0f354a97f6c6b221600ea01c4071742ab3983f5e02ce570b690da2cf0279ba')
sha256sums_x86_64=('f8ee8c76c266a57eed5841a36bdbdedef7d26786d688f49ed1083a29dd050ed9')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
