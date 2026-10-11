# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=jpillora
_pkgname=chisel
pkgname=${_pkgname}-bin
pkgver=1.13.0
pkgrel=1
pkgdesc='A fast TCP/UDP tunnel over HTTP'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
license=('MIT')

conflicts=("${_pkgname}")
provides=("${_pkgname}")

options=('!strip')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch[0]}.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch[1]}.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch[2]}.gz")

sha256sums=('445b61eeea1445c155ad63e1c47b1abfa80a922f2f133577f19c12bf9582c0ff'
            '95df2e9dcd7bd3584cead15caf8405b52320a60997faab1170e0aaf247e77a08')
sha256sums_x86_64=('902a38e824bfb4d4e428faa45607a9b71fc74ff28bf1392cf8121650061c6971')
sha256sums_i686=('cdc1898d91f9762ab5ed4d27be4d40a32cc1f4d0a36177ae4665113007b1422d')
sha256sums_aarch64=('a23daaa1635741f8ef56a44e0506abcdf97251c03bb42433241bbb6c549814e4')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
