# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=triyanox
_pkgname=lla
pkgname=${_pkgname}-bin
pkgver=0.3.6
pkgrel=1
pkgdesc="Blazing fast 'ls' replacement with superpowers"
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-i686")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64")
sha256sums=('23d576c778cda4c3059f8dccbb8b4b79965868099472d089ec589ed0066999c5'
            'f9e8e70258275f1cd63298eb7ef0a51e3fe9cf7f097513a8afb971932ac93d8e')
sha256sums_x86_64=('8d03618a83b281859717c340fe699cc501f68b66cff2eb3f4d7d0699afcfe90e')
sha256sums_i686=('69c5c5f185b5e7d1adaa65c3e0ef4b7790420fc963c3b142fae653157b4ec61a')
sha256sums_aarch64=('27532083714256b436689d35132e0a5b3a486dc9e253b52724a7a85378606d86')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
