# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: liupold <rohn.ch@gmail.com>
# Contributor: parnmatt <matt@parnmatt.co.uk>
# Contributor: 2ion <dev@2ion.de>

_pkgname="cpdf"
pkgname="${_pkgname}-bin"
pkgver=2.7
pkgrel=2
pkgdesc="Coherent PDF commandline tool to manipulate PDF files"
arch=('x86_64' 'i686')
url='http://community.coherentpdf.com'
_url="https://github.com/coherentgraphics/${_pkgname}-binaries"
license=('custom')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_url}/raw/v${pkgver}/"{"README.md","${_pkgname}manual.pdf","LICENSE"}
        "https://github.com/johnwhitington/${_pkgname}-source/raw/v${pkgver}/${_pkgname}.1")
source_x86_64=("${_pkgsrc}-x86_64::${_url}/raw/v${pkgver}/Linux-Intel-64bit/${_pkgname}")
source_i686=("${_pkgsrc}-i686::${_url}/raw/v${pkgver}/old32bit/Linux-Intel-32bit/${_pkgname}")
sha256sums=('25727a710986a396d723ab72b174bdbbe796803d407f6d9fd42a8c22395da00f'
            '51062c5530240aa0c2668a5cb06260a4b8bbcaefd914b59bcaae4f70b31fce5b'
            '908d48c8691169ad5f9ed1aad41da54bbcfd699c1bb70dc281e956c757de5003'
            'ea21fc03cdac99eeb0d7a2370dbe01cb45cce6a0fba2c7e1195e4524127f5e65')
sha256sums_x86_64=('1a81b0a92c2dba9b5a2720434130fba4023ef5c990bc1833d58fe37a4b5e894b')
sha256sums_i686=('85a02374a44935e14b9e84e364c190fd9f9bf3b277d4873decd1bc9da34ce77d')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "${_pkgname}manual.pdf" "${pkgdir}/usr/share/doc/${_pkgname}/${_pkgname}manual.pdf"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"  
}
