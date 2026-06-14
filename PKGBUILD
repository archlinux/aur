# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: liupold <rohn.ch@gmail.com>
# Contributor: parnmatt <matt@parnmatt.co.uk>
# Contributor: 2ion <dev@2ion.de>

_pkgname="cpdf"
pkgname="${_pkgname}-bin"
pkgver=2.9.1
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
sha256sums=('df2705cacee64bfd85c292d2a2663aea9bbf336a7cf88e1125a1ead8aac5309f'
            '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0'
            'fa6f87a3b1bd40091aff9ffbe1909b49a68f0d9d67af1e5d885f2d00a9e2fee1'
            'c352486a140280950126f5d9069e271d58f0026663df03c586ccce39450de47d'
            'e95b8af8a4a2014d8995cf33bba2abb47eb29d06b3c4b107c6ab3a7f1c50f84c')
sha256sums_aarch64=('2ebf8e3d70df1681adc1b9691e3924e8cc94ac95f8553b9dd79753341d970e5c')
sha256sums_i686=('d61476ca3f9c9ce1c08ecb2181fd855366a7253d38a9fff36f63a04f94f52898')
sha256sums_x86_64=('bc39ed19c90a890b819afdbe2a14674355e973314157bd1c41c176bddb8a1ee2')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"      "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-CHANGELOG.txt" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.txt"
  install -vDm644 "${_pkgsrc}-LICENSE.md"    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
  install -vDm644 "${_pkgsrc}-MANUAL.pdf"    "${pkgdir}/usr/share/doc/${_pkgname}/MANUAL.pdf"
  install -vDm644 "${_pkgsrc}-README.md"     "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-man.1"         "${pkgdir}/usr/share/man/man1/${_pkgname}.1"  
}
