# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="gphotos-uploader-cli"
pkgname="${_pkgname}-bin"
pkgver=5.0.0
pkgrel=1
pkgdesc="Command line tool to mass upload media folders to your Google Photos account(s)"
arch=('x86_64')
url="https://gphotosuploader.github.io/gphotos-uploader-cli"
_url="https://github.com/gphotosuploader/${_pkgname}"
license=('MIT')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('f3afec0aa4ab02ab48e2c7dedf54a4f66a9969e46117cdd790b3e02f3fb82d97')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
