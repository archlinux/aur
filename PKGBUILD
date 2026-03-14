# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: liupold <rohn.ch@gmail.com>
# Contributor: parnmatt <matt@parnmatt.co.uk>
# Contributor: 2ion <dev@2ion.de>

_pkgname="cpdf"
pkgname="${_pkgname}-bin"
pkgver=2.9
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
sha256sums=('4331ec026f498993761aa6fd5d39a19f2a5c7d923ce6ececb07d7801cdc233a8'
            '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0'
            '1d161dc9ad3f5752d2fbf3a5053661eaa3653d56a0ff16484467ae9147002cb8'
            'c352486a140280950126f5d9069e271d58f0026663df03c586ccce39450de47d'
            '7f5ffd3873b956c96f73a42150f25460db9dd6649037a882e492afa3c93f3d1e')
sha256sums_aarch64=('3f9893e3c728fb9b8fb270083579253f491be10246070bece540d22b1df78648')
sha256sums_i686=('e4db288bdcb6c03f60921451cc80d31b2b10de17700f2f3e5b2e9c666318cc25')
sha256sums_x86_64=('d87e9d912c868c6f2abee4fd925dc99aec9f5376388d8cc8dc83d19b02564209')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"      "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-CHANGELOG.txt" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.txt"
  install -vDm644 "${_pkgsrc}-LICENSE.md"    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
  install -vDm644 "${_pkgsrc}-MANUAL.pdf"    "${pkgdir}/usr/share/doc/${_pkgname}/MANUAL.pdf"
  install -vDm644 "${_pkgsrc}-README.md"     "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-man.1"         "${pkgdir}/usr/share/man/man1/${_pkgname}.1"  
}
