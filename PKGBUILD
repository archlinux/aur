# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: liupold <rohn.ch@gmail.com>
# Contributor: parnmatt <matt@parnmatt.co.uk>
# Contributor: 2ion <dev@2ion.de>

_pkgname="cpdf"
pkgname="${_pkgname}-bin"
pkgver=2.8
pkgrel=3
pkgdesc="Coherent PDF commandline tool to manipulate PDF files"
arch=('aarch64' 'i686' 'x86_64')
url="https://community.coherentpdf.com"
_url_bin="https://github.com/coherentgraphics/cpdf-binaries"
_url_src="https://github.com/johnwhitington/cpdf-source"
license=('AGPL-3.0-or-later OR custom:Coherent PDF License')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-ACKNOWLEDGEMENTS.md::${_url_bin}/raw/refs/tags/v${pkgver}/ACKNOWLEDGEMENTS.md"
        "${_pkgsrc}-LICENSE.md::${_url_bin}/raw/refs/tags/v${pkgver}/LICENSE.md"
        "${_pkgsrc}-MANUAL.pdf::${_url_bin}/raw/refs/tags/v${pkgver}/cpdfmanual.pdf"
        "${_pkgsrc}-README.md::${_url_bin}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-man.1::${_url_src}/raw/refs/tags/v${pkgver}/${_pkgname}.1")
source_aarch64=("${_pkgsrc}-aarch64::${_url_bin}/raw/refs/tags/v${pkgver}/Linux-ARM-64bit/${_pkgname}")
source_i686=("${_pkgsrc}-i686::${_url_bin}/raw/refs/tags/v${pkgver}/Linux-Intel-32bit/${_pkgname}")
source_x86_64=("${_pkgsrc}-x86_64::${_url_bin}/raw/refs/tags/v${pkgver}/Linux-Intel-64bit/${_pkgname}")
sha256sums=('9b7e59d3b6574d31426abc8004f3445ab55495d48020f9c0eab9ca0234631f42'
            '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0'
            '7388f698fe65510673400c62716fa8ec9a7e411fbf31a1086614117e868a24ca'
            'faac74183c571371f9a2e15102db31064a3b53f101e38b8894cc4757f426e5ab'
            'b6f4d42627c094365103a5a8c750b0ae020b385fdd785f8deede3f472576ec09')
sha256sums_aarch64=('4003a5333fed2007540cf1f30bb748e67d8c813ed949ec597816a3b350562ea2')
sha256sums_i686=('1cb206f50e6f911e931baf4f8c0ada0b36fecca5199739af2c981c3ab9a96f2f')
sha256sums_x86_64=('efca6db7f6293021d653bc0d0ca20e11970701497bf70acdab3a3bac5d57b28f')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-ACKNOWLEDGEMENTS.md" "${pkgdir}/usr/share/doc/${_pkgname}/ACKNOWLEDGEMENTS.md"
  install -vDm644 "${_pkgsrc}-LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
  install -vDm644 "${_pkgsrc}-MANUAL.pdf" "${pkgdir}/usr/share/doc/${_pkgname}/MANUAL.pdf"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-man.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"  
}
