# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=n0-computer
_pkgname=sendme
pkgname=${_pkgname}-bin
pkgver=0.34.0
pkgrel=1
pkgdesc='A tool to send files and directories'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT' 'Apache')
depends=('glibc')
makedepends=('tar')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=('!strip')
source=("README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-MIT-${pkgver}::${_urlraw}/LICENSE-MIT"
        "LICENSE-APACHE-${pkgver}::${_urlraw}/LICENSE-APACHE")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${arch[0]}.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-${arch[1]}.tar.gz")
sha256sums=('2aa4c34073e5f174c9f43b2f7a1a1ecc0865574ebf765467fe7ac219d34438f0'
            '339060c99d5c80c2742cae417f765980afe6b0149a78f959bbf2a79f19ab3af5'
            '7953ad8cebf4e01199521a5faa221ef59bec5cee0a9856b179590613a8560cbc')
sha256sums_x86_64=('aad7b12f224251cfea5c5fb988089cb9b354ede9d2ed90fde9405ec0a8717902')
sha256sums_aarch64=('d72d2a7e178ee719dceff04fbc04e30acada4ad6b386dd8260cbd28f335fadf4')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 "LICENSE-APACHE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
