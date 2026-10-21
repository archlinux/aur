# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: liupold <rohn.ch@gmail.com>
# Contributor: parnmatt <matt@parnmatt.co.uk>
# Contributor: 2ion <dev@2ion.de>

_pkgname="cpdf"
pkgname="${_pkgname}-bin"
pkgver=2.9.3
pkgrel=1
pkgdesc="Coherent PDF commandline tool to manipulate PDF files"
arch=(
  'aarch64'
  'i686'
  'x86_64'
)
url="https://community.coherentpdf.com"
_url_bin="https://github.com/coherentgraphics/cpdf-binaries"
_url_src="https://github.com/johnwhitington/cpdf-source"
license=(
  'AGPL-3.0-or-later OR custom:Coherent PDF License'
)
depends=(
  'glibc'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-CHANGELOG.txt::${_url_bin}/raw/refs/tags/v${pkgver}/Changes.txt"
  "${_pkgsrc}-LICENSE.md::${_url_bin}/raw/refs/tags/v${pkgver}/LICENSE.md"
  "${_pkgsrc}-MANUAL.pdf::${_url_bin}/raw/refs/tags/v${pkgver}/cpdfmanual.pdf"
  "${_pkgsrc}-README.md::${_url_bin}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-man.1::${_url_src}/raw/refs/tags/v${pkgver}/${_pkgname}.1"
)
source_aarch64=(
  "${_pkgsrc}-aarch64::${_url_bin}/raw/refs/tags/v${pkgver}/Linux-ARM-64bit/${_pkgname}"
)
source_i686=(
  "${_pkgsrc}-i686::${_url_bin}/raw/refs/tags/v${pkgver}/Linux-Intel-32bit/${_pkgname}"
)
source_x86_64=(
  "${_pkgsrc}-x86_64::${_url_bin}/raw/refs/tags/v${pkgver}/Linux-Intel-64bit/${_pkgname}"
)
sha256sums=('77b3475f9e18fb002d35ea0c65e21da8b2d8d0518c142286681bdc981b9a4657'
            '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0'
            '0cea57450c3dba163aa118b023738db5f94e26de7b2a80a1e40ef04f9bb21fe9'
            'c7251ef459d959300008f59ab8249c16d67fce224fd5e1d4e94d9753ae40007f'
            'fc176bda5396d33d3da5fc7356364c7322fc44777fdbc04ec5e8c02f7877d653')
sha256sums_aarch64=('3b8bbe53f47902ae90b13222881fbe00928a63b5553dfafc3c3901c13b62848c')
sha256sums_i686=('1907d61f54a7fe332c6bd24ab49450308d6737d18f58a2c2fa64d4d895a2d6eb')
sha256sums_x86_64=('37511a498ae58df68ba1f52003435743f23c285f634f552da267df1b74e822b9')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"      "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-CHANGELOG.txt" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.txt"
  install -vDm644 "${_pkgsrc}-LICENSE.md"    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
  install -vDm644 "${_pkgsrc}-MANUAL.pdf"    "${pkgdir}/usr/share/doc/${_pkgname}/MANUAL.pdf"
  install -vDm644 "${_pkgsrc}-README.md"     "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-man.1"         "${pkgdir}/usr/share/man/man1/${_pkgname}.1"  
}
