# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Maintainer:  cclin<cclinet@outlook.com>

_pkgname="otel-tui"
pkgname="${_pkgname}-bin"
pkgver=0.7.1
pkgrel=1
pkgdesc="A terminal OpenTelemetry viewer inspired by otel-desktop-viewer"
arch=('aarch64' 'x86_64')
url="https://github.com/ymtdzzz/${_pkgname}"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!debug')
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
sha256sums_aarch64=('2253e33c47d56cc8d03acfa06e6b280ce9afdf6c29ff5276bd74a64445b40668')
sha256sums_x86_64=('57ddbd272301fcdfd0bb03161a148fee80271871c6f81f332263296e007c511d')
#sha256sums_i686=('31b5ff706871a3cda4cf10ed0c539fb7464cee0664149d47e4d56b58027726e8')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
