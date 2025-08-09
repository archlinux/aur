# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=chaqchase
_pkgname=lla
pkgname=${_pkgname}-bin
pkgver=0.4.0
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
            '5de68bcccee39cef42e4d6f2c146ca7bcf1f91269b1bedba52405566bb9aed0e')
sha256sums_x86_64=('78edf8a071bef5558024eccbfbf3af0b6540877aa7d384fa8d62fd21a5c1b5b8')
sha256sums_i686=('4d8bdfe4dca8e845b0f8281d426ae8bffb8ae902d8b7aed1778084a61471f04e')
sha256sums_aarch64=('1070dfd14e45993f929ca5eaac380f0a9474eb3993d241d338949f59256df9ea')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
