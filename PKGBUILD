# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="otel-tui"
pkgname="${_pkgname}-bin"
pkgver=0.4.1
pkgrel=1
pkgdesc="A terminal OpenTelemetry viewer inspired by otel-desktop-viewer"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/ymtdzzz/${_pkgname}"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
sha256sums_aarch64=('0676560cf4f2987ef190c67737a1c8c39ccd999f7cc1141d263e7f9ed5f7ddba')
sha256sums_i686=('a5f9ebe424ce73f85c0867804a60c72c2d818f16294e3e8c4dd799090829200b')
sha256sums_x86_64=('a673d63811c40a78f7b843fd3971d462cf9b392c346ad6bcba907238dc6e891e')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
