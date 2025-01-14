# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=pkgxdev
_pkgname=pkgx
pkgname=${_pkgname}-bin
pkgver=2.0.0
pkgrel=1
pkgdesc='Run Anything'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE.txt"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}+linux+${arch[0]/_/-}.tar.xz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}+linux+${arch[1]}.tar.xz")
sha256sums=('f9e73cf0b1182acbe4d2c623f9970c131c0be0d955bb0609cd98551eabf9f118'
            '218a6a856a30266c77540ff974de2a153dcdf2186f1e66054751c62ddc185d4a')
sha256sums_x86_64=('2e1de69c250284f4147e51b1bacb06049ef447f13fe23373dd3b708789762328')
sha256sums_aarch64=('c300b45178d759d57d2972375ad320164653bf7bedc65ed44a0f9896b73ae968')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
