# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=pkgxdev
_pkgname=pkgx
pkgname=${_pkgname}-bin
pkgver=2.1.0
pkgrel=1
pkgdesc='Run Anything'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=('!strip')
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE.txt"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}+linux+${arch[0]/_/-}.tar.xz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}+linux+${arch[1]}.tar.xz")
sha256sums=('f9e73cf0b1182acbe4d2c623f9970c131c0be0d955bb0609cd98551eabf9f118'
            'd09c7568249b776d9d1e7a6e70bb20af510b75cbed2553fface3df4515ce2974')
sha256sums_x86_64=('8654498c0e1a557d1d24819fb7b76d90734afe5e6fe4de1106213f70a5ed74ac')
sha256sums_aarch64=('d50ad6ad8f79f4431f1f2f9d5568b71580d1d780ea10cd4ca2bf5ab400d3dd50')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
