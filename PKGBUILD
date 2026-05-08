# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=blacknon
_pkgname=twatch
pkgname=${_pkgname}-bin
pkgver=0.1.1
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
sha256sums_x86_64=('b69357781ca2e3f9f5fa5f44101d2dc956f8e3335def1cf998ff18079ff82755')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
