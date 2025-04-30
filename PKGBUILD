# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="notify"
pkgname="${_pkgname}-bin"
pkgver=1.0.7
pkgrel=1
pkgdesc="Stream the output of several tools (or read from a file) and publish it to a variety of supported platforms"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://github.com/projectdiscovery/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${url##*/}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.zip")
source_armv7h=("${_pkgsrc}-armv7h.zip::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm.zip")
source_i686=("${_pkgsrc}-i686.zip::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_386.zip")
source_x86_64=("${_pkgsrc}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.zip")
sha256sums_aarch64=('40cdfd87077802a839842e921487d9b120d51f24a46a8b29cf54ce5bdad0eb2f')
sha256sums_armv7h=('e6bb5aa1d7b039c61c6d4773e700e6a50de6be4c29ba5d25d78c92b9110b2a07')
sha256sums_i686=('a4979b50b9df09fba6c5cb9318ffa94e001a70160628bb78dc22868e707f48bb')
sha256sums_x86_64=('063c65e3cc1df26e19278c01e5b9ff8c9e3beec4b23b256b389d7c9314fa9f1f')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.md"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
