# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="simplehttpserver"
pkgname="${_pkgname}-bin"
pkgver=0.0.6
pkgrel=1
pkgdesc="Go alternative of python SimpleHTTPServer"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://github.com/projectdiscovery/${_pkgname}"
license=('MIT')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${url##*/}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.zip::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.zip")
source_armv7h=("${_pkgsrc}-armv6h.zip::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_armv6.zip")
source_i686=("${_pkgsrc}-i686.zip::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_386.zip")
source_x86_64=("${_pkgsrc}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.zip")
sha256sums_aarch64=('1905f196dcedbfd69fd1ab726eb21893193aaba6e6a1a3cc7ac574383308c55a')
sha256sums_armv7h=('18ee7ed3ede5d5d48137e19b7b9abc7423505c319f8c05ffbc84d4b7efff2054')
sha256sums_i686=('e28c80f8ba69c61607bf5e8e02a998d28dd8ae0079f994643c71ff9eec471248')
sha256sums_x86_64=('6f94cfd976a73cd8a410f33c119954a661da930226a47c21c83f3c358362f994')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.md"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
