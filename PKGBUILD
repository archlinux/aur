# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=sheepla
_pkgname=srss
pkgname=${_pkgname}-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='A command line RSS/ATOM/JSON feed reader'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_i386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('21d771ddaa087190aac5edf4bffbea259c056c59197482f7b2c307ce564e5e34')
sha256sums_i686=('11517760bf294d4ba779570a62954d4b534179d8682b511bb38a67d7ae8ef5b0')
sha256sums_aarch64=('59d3de374f271bc9272b9f41c1c1326abf24bf931fc4f2d0b26aec0505de4d70')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
