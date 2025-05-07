# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: liupold <rohn.ch@gmail.com>
# Contributor: parnmatt <matt@parnmatt.co.uk>
# Contributor: 2ion <dev@2ion.de>

_pkgname="cpdf"
pkgname="${_pkgname}-bin"
pkgver=2.8.1
pkgrel=1
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
        "${_pkgsrc}-CHANGELOG::${_url_bin}/raw/refs/tags/v${pkgver}/Changes"
        "${_pkgsrc}-LICENSE.md::${_url_bin}/raw/refs/tags/v${pkgver}/LICENSE.md"
        "${_pkgsrc}-MANUAL.pdf::${_url_bin}/raw/refs/tags/v${pkgver}/cpdfmanual.pdf"
        "${_pkgsrc}-README.md::${_url_bin}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-man.1::${_url_src}/raw/refs/tags/v${pkgver}/${_pkgname}.1")
source_aarch64=("${_pkgsrc}-aarch64::${_url_bin}/raw/refs/tags/v${pkgver}/Linux-ARM-64bit/${_pkgname}")
source_i686=("${_pkgsrc}-i686::${_url_bin}/raw/refs/tags/v${pkgver}/Linux-Intel-32bit/${_pkgname}")
source_x86_64=("${_pkgsrc}-x86_64::${_url_bin}/raw/refs/tags/v${pkgver}/Linux-Intel-64bit/${_pkgname}")
sha256sums=('9b7e59d3b6574d31426abc8004f3445ab55495d48020f9c0eab9ca0234631f42'
            '0d7e0d307216284a9f0da3e50f5644ae65210ef430ef718adff3fc6b3353441c'
            '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0'
            '6222c91586e6c74d78747e5f6517eb229ffd86212a5cf7b1b2aceba509f576d9'
            'f8fa3bce75355f5660ba7c50390cacc48515d3c8a29a261c0f69cbfd34ba545f'
            '37a49a55287c635feff4c5ad3ae1dc013b94cb8862263ef7a41cf466b0cd3298')
sha256sums_aarch64=('5177afa948545b8b858f6318483589041372cd3a90b31666a9f4628f95a28040')
sha256sums_i686=('6d44dec20fe94522f22160c6b1e22bd31a9ad38bb42f7fe675a1bbf46566dee0')
sha256sums_x86_64=('ea8be82934fbbc6f7c4d39de0a62acd415214f53049d0b93fe7d801e54d86abf')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-ACKNOWLEDGEMENTS.md" "${pkgdir}/usr/share/doc/${_pkgname}/ACKNOWLEDGEMENTS.md"
  install -vDm644 "${_pkgsrc}-CHANGELOG" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG"
  install -vDm644 "${_pkgsrc}-LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
  install -vDm644 "${_pkgsrc}-MANUAL.pdf" "${pkgdir}/usr/share/doc/${_pkgname}/MANUAL.pdf"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-man.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"  
}
