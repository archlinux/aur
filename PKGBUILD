# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=triyanox
_pkgname=lla
pkgname=${_pkgname}-bin
pkgver=0.3.1
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
            '35d246eda7608d7be0afb513288953839b1a3987e825fda717d65e17c53f9df0')
sha256sums_x86_64=('80fe99479e4cabfa118f38a5b3e23af6bb047656bf06e6593488ab6c9ff6308d')
sha256sums_i686=('1a18323c109a3151c9fcd9bc155403be0cd86cd16a9aea93d319899ab9bd4c13')
sha256sums_aarch64=('699a09fb79af5c38a8212f37d367bdf6559d9d51ce6689e4169c554adfc35f19')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
