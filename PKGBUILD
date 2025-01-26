# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="otel-tui"
pkgname="${_pkgname}-bin"
pkgver=0.4.0
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
sha256sums_aarch64=('4e773a8fc64a0cdca10eec8bd82bddf98bcd5ebe9d5537465caec4a1bb620cde')
sha256sums_i686=('b5f8e31f0f96ada56661798d521c5f78c8843c773704853055515c5e703baf2f')
sha256sums_x86_64=('586ed97ff69923b4d559db4e4ed14b6aedaf9401899cf8b986ba9f42ea20948d')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
