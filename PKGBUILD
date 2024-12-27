# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=jmelahman
_pkgname=nature-sounds
pkgname=${_pkgname}-bin
pkgver=0.2.9
pkgrel=1
pkgdesc='A lightweight, nature sounds player for the command-line'

arch=('x86_64')
_barch=('linux_amd64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"

license=('GPL-3.0')

provides=("${_pkgname}")
conflicts=("${pkgname%-bin}")

depends=('alsa-utils')

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_${_barch[0]}.tar.gz")
sha256sums_x86_64=('b0ef059c42eca395a7ff32f59d8ffe0362e0611819729e874bb2e9827fa6c8b7')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
