# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=szktkfm
_pkgname=mdtt
pkgname=${_pkgname}-bin
pkgver=0.2.1
pkgrel=1
pkgdesc='Markdown Table Editor TUI'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source_x86_64=("${_pkgname}-${pkgver}-${arch[0]}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
source_i686=("${_pkgname}-${pkgver}-${arch[1]}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-${arch[2]}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
sha256sums_x86_64=('d624a5b52fe905e41d80dc15850534c3d87947940e4e615e1738d2a8ba82fe5c')
sha256sums_i686=('f6af5f3ce4b4c40d689df314f97bf9a4821ee9fb10c369b5cad84077ee1c3c16')
sha256sums_aarch64=('c695e17e16d4b5d1db17b66779d229cb9d588a7b413f6deb42a63ebf65c7c2a2')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
