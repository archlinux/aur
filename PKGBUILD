# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=DizoftTeam
_pkgname=dron
pkgname=${_pkgname}-bin
pkgver=1.3.3
pkgrel=1
pkgdesc='Small command line shell executor'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
arch=('x86_64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/${pkgver}/${_pkgname}.Linux.${arch[0]}")
sha256sums=('4815cd2174683016b764841ac42b6a12a2fca07ea79593361f8b02779721b24b'
            '20a566e57b72ea280d9770866ac8a82bc11555f5ad6892242e6209de17c2b2c7')
sha256sums_x86_64=('44a784d6d4fdab7baab00a8268c58d4666c539cd271aa6ac3363739535fc50ce')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
