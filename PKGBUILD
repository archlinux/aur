# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname=gphotos-uploader-cli
pkgname=${_pkgname}-bin
pkgver=4.5.0
pkgrel=1
pkgdesc="Command line tool to mass upload media folders to your Google Photos account(s)"
arch=('x86_64')
url="https://github.com/gphotosuploader/${_pkgname}"
license=('MIT')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('58a7f73d32c896852f877265baadf60b105ee4b3fbee58330d8ad0722c856102')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}