# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Systemcluster
_pkgname=wrappe
pkgname=${_pkgname}-bin
pkgver=1.0.6
pkgrel=1
pkgdesc='Packer for creating self-contained single-binary applications from executables and directories'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux")
sha256sums=('d58ac9ac6ec1e81f7028f5dbce0fa252dae0ee540dd970c929b7dfd18d3589c3'
            'd9bd44920edaf85478c1b26bb9bb0dc1f4f2892ed09a38eb00845930fd5c1cff')
sha256sums_x86_64=('aa4f845f1e2cc91b3fb27b9bf4727463217a750866cc5f30f27b59b3dc88025e')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-linux" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
