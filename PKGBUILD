# Maintainer: Jasmin <theblazehen@gmail.com>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="slackdump"
pkgname="${_pkgname}-bin"
pkgver=4.2.0
pkgrel=1
pkgdesc="Save your private and public Slack messages, threads, files, and users locally"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/rusq/${_pkgname}"
license=('GPL-3.0-only')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
b2sums_aarch64=('dc8e05bfa09bad34662a2dc125e749cff5c4e33e1f9a8ce362f5f909f7ba32ee7256c36b761310b7b2498f215fa390be01a45fe0f195005aa2ceb882a968f7ea')
b2sums_i686=('9d7a9cc634b8aacf8f21e8f1dbffe44b20d3c4424f57482286fa8cff4a92711c7e72b886f2d49e0bf56037dca0ffc2bb73ec220cca2a49bfe8afb4e8e73cfaf5')
b2sums_x86_64=('04c1d01c6a5b00dd5b6671496a188bb434cf9e3775e8156a27830ec321c09020ceac7004f01a95630b0a89fe16e85aa80e9f0b182f999f7d589163602dfe41e1')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"   "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"     "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"       "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
