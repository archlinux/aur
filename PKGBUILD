# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=chaqchase
_pkgname=lla
pkgname=${_pkgname}-bin
pkgver=0.5.2
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
            '7be6bb29145cb9f8abc137b16e003f997463c561bfc31c2d57aa8c002e9cef98')
sha256sums_x86_64=('a8f1e890a4895586310815e3649b1fec7141d9f2de87345395b7750b260408c2')
sha256sums_i686=('a70aa74885ce7fc0c609f07ad7f0b5c2a0d05876ca406d9132fae079acc3f41e')
sha256sums_aarch64=('9d6d7bb6300b78beda750323e3017a8aff10d05d99dad4b030d83b94ca03371d')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
