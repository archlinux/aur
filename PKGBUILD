# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=VHSgunzo
_pkgname=sharun
pkgname=${_pkgname}-bin
pkgver=0.6.1
pkgrel=1
pkgdesc='Run dynamically linked ELF binaries everywhere'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=('!strip')
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[0]}")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[1]}")
sha256sums=('ed1795c447be9b4ae96262f583b559f733a82f627b0265f860f22488c7f8b2ff'
            '40316c5551bae75b81f0c49ad5d659d9d196483fecf9e60c5c6f87c543905ade')
sha256sums_x86_64=('dda9e8f4799005a92a186306d4cfbdcc1afebb4f77a46b9091eaa4f38efe5ed9')
sha256sums_aarch64=('f76745ebd4780912b050d7c3a80768dbf0642c33abb03a8c0810e80c37f3549b')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
