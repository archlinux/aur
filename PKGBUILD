# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: liupold <rohn.ch@gmail.com>
# Contributor: parnmatt <matt@parnmatt.co.uk>
# Contributor: 2ion <dev@2ion.de>

_pkgname="cpdf"
pkgname="${_pkgname}-bin"
pkgver=2.7.1
pkgrel=2
pkgdesc="Coherent PDF commandline tool to manipulate PDF files"
arch=('x86_64' 'i686')
url="http://community.coherentpdf.com"
_url_bin="https://github.com/coherentgraphics/${_pkgname}-binaries"
_url_src="https://github.com/johnwhitington/${_pkgname}-source"
license=('AGPL-3.0-or-later' 'custom:Coherent PDF license')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${_url_bin}/raw/v${pkgver}/README.md"
        "LICENSE-${pkgver}.md::${_url_bin}/raw/v${pkgver}/LICENSE.md"
        "MANUAL-${pkgver}.pdf::${_url_bin}/raw/v${pkgver}/cpdfmanual.pdf"
        "${_pkgsrc}.man.1::${_url_src}/raw/v${pkgver}/${_pkgname}.1")
source_x86_64=("${_pkgsrc}-x86_64::${_url_bin}/raw/v${pkgver}/Linux-Intel-64bit/${_pkgname}")
source_i686=("${_pkgsrc}-i686::${_url_bin}/raw/v${pkgver}/old32bit/Linux-Intel-32bit/${_pkgname}")
sha256sums=('ce7ff77fcead0f883823189e5e959f272fec75ed8d33e6853244ba891915c2c7'
            'd4a4fdea0b721b0a0b4bd9e5309892c007560645ae2549999270514362a7ecb4'
            '08c78183de44202bf30dfd80c7f91e0cf3fbdab33e46980435601e27262b1509'
            'b77301f463ea33fded01b25df9ae353f9f4633583762ad9b9ae533091aa3279e')
sha256sums_x86_64=('e050f26b5cd5c3fad05569d33ea9b4af8c3c3a5be649306ba7cf58a06dae084d')
sha256sums_i686=('85a02374a44935e14b9e84e364c190fd9f9bf3b277d4873decd1bc9da34ce77d')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md"  "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "MANUAL-${pkgver}.pdf" "${pkgdir}/usr/share/doc/${_pkgname}/MANUAL.pdf"
  install -Dm644 "LICENSE-${pkgver}.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
  install -Dm644 "${_pkgsrc}.man.1"     "${pkgdir}/usr/share/man/man1/${_pkgname}.1"  
}
