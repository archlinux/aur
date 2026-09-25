# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: liupold <rohn.ch@gmail.com>
# Contributor: parnmatt <matt@parnmatt.co.uk>
# Contributor: 2ion <dev@2ion.de>

_pkgname="cpdf"
pkgname="${_pkgname}-bin"
pkgver=2.9.2
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
sha256sums=('c3580b9a57efdd68773e761274762da297e2f26513123b076f0273836549a3f4'
            '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0'
            '457d7347326535a147fe81763b2724a753e1e69ceb04e381320aa6b3ae3c6050'
            'c352486a140280950126f5d9069e271d58f0026663df03c586ccce39450de47d'
            '376e0a75c93d69568dbe96bedbb59638cf0a2ea4786068550c520141040fdbb1')
sha256sums_aarch64=('ac0f9a0a38ac17da49bf39b950588711445965de4d852dbd467694abb825d5df')
sha256sums_i686=('fbc31a6ff67bd8c7fd5b156d5013e447ef5d77b6052a46f9131c98cdacbcfc74')
sha256sums_x86_64=('74577980b2ed6cf65c673acf8b8a587ce3d6f6ed44b373a9dcd1f3d113b269ed')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"      "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-CHANGELOG.txt" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.txt"
  install -vDm644 "${_pkgsrc}-LICENSE.md"    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
  install -vDm644 "${_pkgsrc}-MANUAL.pdf"    "${pkgdir}/usr/share/doc/${_pkgname}/MANUAL.pdf"
  install -vDm644 "${_pkgsrc}-README.md"     "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-man.1"         "${pkgdir}/usr/share/man/man1/${_pkgname}.1"  
}
