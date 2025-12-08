# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=sheepla
_pkgname=pingu
pkgname=${_pkgname}-bin
pkgver=0.0.5
pkgrel=1
pkgdesc='🐧ping command but with pingu'
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
sha256sums_x86_64=('bd446cb4c650725215cb3e59632fc152b36a40aff7c77841bd4c08cf23de6418')
sha256sums_i686=('7220532ea023a777d7ea2e4c90dae7887663e28914813dcf904276769e0dc93e')
sha256sums_aarch64=('4b38e177c305ed387f1643ba10570b5a6e88bc26d9f0111c4b8312de36293cc1')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
