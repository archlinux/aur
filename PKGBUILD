# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=ariasmn
_pkgname=ugm
pkgname=${_pkgname}-bin
pkgver=1.8.0
pkgrel=1
pkgdesc='A terminal based UNIX user and group browser'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${pkgver}-${arch[0]}::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64")
source_i686=("${_pkgname}-${pkgver}-${arch[1]}::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386")
source_aarch64=("${_pkgname}-${pkgver}-${arch[2]}::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64")
sha256sums=('f948894f617a6490d2ad9c84673cc1b1fb746ba0d08b263046c9ca78a9d60b8d'
            '8deecbb70d79901cd0ad6f66ac76c645f23a12d4188f3fc7f0386bbeadbf1c73')
sha256sums_x86_64=('c00be06d142e6e3b66c6323867aa4dcb62c34c95efa52821141597ffdb635c2e')
sha256sums_i686=('9061b6ffdf3b80c642280074f7dec7b0b0a164a180ae999425304711bb413bd0')
sha256sums_aarch64=('d67ac9486521b59f30220ee2f4e2a32dc0afcc617497491df0b92aa6a70c3dcc')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
