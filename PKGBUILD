# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=zahash
_pkgname=quarantine
pkgname=${_pkgname}-bin
pkgver=0.1.3
pkgrel=1
pkgdesc='Quickly and easily create sandbox to run untrusted code'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}-${arch[0]}-linux")
sha256sums=('6f27243cfd82ff938f0f4e8121069ac3658d283740bc9c4b8da5c87ec3b834e7'
            '2bca507de708c630c11678749e5b43c4eb9a48f0cf3fc6047e4306a99ff84b65')
sha256sums_x86_64=('985dbd96678ad039507bcd05602093626af36c486011a5bcd9deea5a9876ef87')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
