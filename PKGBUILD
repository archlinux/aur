# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=blacknon
_pkgname=twatch
pkgname=${_pkgname}-bin
pkgver=0.1.3
pkgrel=1
pkgdesc='Wrap a child TUI app and keep screen history'

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"

arch=('x86_64')
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.${arch[0]}-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('16b15abf0c5b5a5c1352b14a707ed3cb8640ccbbbaf488535607918b39e70edb')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
