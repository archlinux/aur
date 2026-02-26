# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Owloops
_pkgname=updo
pkgname=${_pkgname}-bin
pkgver=0.4.6
pkgrel=1
pkgdesc="Uptime monitoring CLI tool with alerting and advanced settings"
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
_barch=('x86_64' 'arm64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_${_barch[1]}")

sha256sums=('c4bb03bd6f1bc39a9a068700598796514a826d115a8a10c5d3fb9593ccbda18e'
            '49d4a4d3c6e92ddbb82ab4090939e0e4998a0540f093f4bae1c9d4640f1eb562')
sha256sums_x86_64=('5048b4e83f0d1b5a4ac73e886cc4d1014d9c95ffaad85f7f038b964ce383eb90')
sha256sums_aarch64=('ab18ad8b4ae7b537fb51e3b02f217023f022d9c0831fe2d7e48da99276d47561')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
