# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=zahash
_pkgname=royalguard
pkgname=${_pkgname}-bin
pkgver=0.4.3
pkgrel=1
pkgdesc='Secure Ergonomic Command Line Password Manager'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[0]}-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('1e8336d8d690542fe14eadb8681b13d30ca00f0c5ffa5e879b81ffb3ecee53e9')

package() {
  cd "${srcdir}/${_pkgname}-${arch[0]}-unknown-linux-gnu/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
