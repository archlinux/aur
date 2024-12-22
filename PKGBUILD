# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=Soft
_pkgname=rainbowpath
pkgname=${_pkgname}-bin
pkgver=0.5.2
pkgrel=1
pkgdesc='Program for making paths pretty.'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}.tar.gz")
sha256sums_x86_64=('0fe6b62e53266939ba70ed30ca201bbe0d85e50b8d5d7e3faaac5c8347e880f3')

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
