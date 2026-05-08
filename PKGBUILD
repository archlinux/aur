# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=blacknon
_pkgname=twrap
pkgname=${_pkgname}-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='A TUI wrapper for applying rules to live terminal screens'

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"

arch=('x86_64')
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.${arch[0]}-unknown-linux-gnu.tar.gz")
sha256sums=('817b3fba984ddaa8a9a5694c52f79c4b63f524ffe40ade1f85f2c90ee34b3e22'
            '00435dd5575cf7d819f4d4c96d0ffbc89e56197949ef622ac59e8d704a014338')
sha256sums_x86_64=('640a6f8e9f256317158a0ebd17e21cae7c653551bc2574543569634d570a928c')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
