# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=zahash
_pkgname=csc
pkgname=${_pkgname}-bin
pkgver=0.1.9
pkgrel=1
pkgdesc='Command Line Scientific Calculator'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[0]}-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('de8e27dc845dfdf636fe9b335feb03010f9d6532e2db013976d159d55d2f15eb')

package() {
  cd "${srcdir}/${_pkgname}-${arch[0]}-unknown-linux-gnu/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
