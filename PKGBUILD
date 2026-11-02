# Maintainer: agony <27015 at riseup dot net>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="sngrep"
pkgname="${_pkgname}-bin"
pkgver=1.9.0
pkgrel=1
pkgdesc="A tool for displaying SIP call message flows from a terminal"
arch=('x86_64')
url="https://github.com/irontec/${_pkgname}"
license=('GPL-3.0-or-later')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=("etc/${_pkgname}rc")
install="${pkgname}.install"
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README"
        "${_pkgsrc}.man.8::${url}/raw/refs/tags/v${pkgver}/doc/${_pkgname}.8"
        "${_pkgsrc}-${_pkgname}rc::${url}/raw/refs/tags/v${pkgver}/config/${_pkgname}rc")
source_x86_64=("${_pkgsrc}-x86_64::https://packages.irontec.com/binaries/${_pkgname}-static-amd64-linux-gnu-${pkgver}")
sha256sums=('6aab9564131a94f4d0cd03f93376010cb7ab66d0402d1c6aa2d5f82ed594d3ab'
            '2b3630e53485f63bc976776ecbcbd2e6f700c93ee38dca691a129e1986271ad9'
            '55312b67d560ad9e8685f53a637c976a1253acf767798aba05a091a5fe86f439')
sha256sums_x86_64=('83f7489d88113ee730cb30b1b4ad5e09dc4041fcf507b6da340957955e8358f9')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}.man.8" "${pkgdir}/usr/share/man/man8/${_pkgname}.8"
  install -vDm644 "${_pkgsrc}-${_pkgname}rc" "${pkgdir}/etc/${_pkgname}rc"
}
