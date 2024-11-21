# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>


_pkgauthor=Usbac
_pkgname=borealis
pkgname=${_pkgname}
pkgver=0.3.0
pkgrel=1
pkgdesc='The elegant and consistent programming language.'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

source=("${_pkgname}-${pkgver}::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1c3b696a9f1ca560d0eea5669fbd5787aaa8661d19f7b66c287109c8f6101404')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/" || exit

  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -Dm644 "CONTRIBUTING.md" "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTING.md"
}
