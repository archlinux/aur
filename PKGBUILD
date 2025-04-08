# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=ariasmn
_pkgname=ugm
pkgname=${_pkgname}-bin
pkgver=1.7.0
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
sha256sums_x86_64=('bbf17e7abe9e438f1705f9ee28e5657c29ecdd7357cd9064a0518692be849f9b')
sha256sums_i686=('24386947c113c503801777f6acf6af9cb1cb196b987474d26f6d20f002158f2e')
sha256sums_aarch64=('57c417499216422b9448b612e4f9b8302a04314492d7b3a77eb28ce041286c9f')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
