# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="alterx"
pkgname="${_pkgname}-bin"
pkgver=0.0.6
pkgrel=1
pkgdesc="Fast and customizable subdomain wordlist generator using DSL"
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
sha256sums_aarch64=('2fe2a4f78c1e98d9e70d667a202ce02a6119c9d0bbaa53624c8f8d2f3b782fcf')
sha256sums_armv7h=('a836c838e9ecd2b931e22f769d24dc0fb36e54a9d1b76b17ff8c97ec6824a2a6')
sha256sums_i686=('bf61ed61642af4ee1f8595b74a1bfffdbde035ceae5d22993498da8ef9c37f94')
sha256sums_x86_64=('b1d8a43ba9e7afa31a27fd050a1c4f1157f60d074443836dbea1ac8ccc34fc0a')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.md"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
