# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=pkgxdev
_pkgname=pkgx
pkgname=${_pkgname}-bin
pkgver=2.6.0
pkgrel=1
pkgdesc='Run Anything'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc' 'gcc-libs')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=('!strip')
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE.txt"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}+linux+${arch[0]/_/-}.tar.xz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}+linux+${arch[1]}.tar.xz")
sha256sums=('f9e73cf0b1182acbe4d2c623f9970c131c0be0d955bb0609cd98551eabf9f118'
            '76110f79a978d5106feb487718580e122f4a30ab6b4f855da199790b035cf78f')
sha256sums_x86_64=('0849555b68de46dfc48d236e99ac5a778cbca84a2a7b988f3c54d025a5ab4524')
sha256sums_aarch64=('4276beec8d395a34f25a402d3dba92889bce43133daf72eb61d95cbdc40236f4')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
