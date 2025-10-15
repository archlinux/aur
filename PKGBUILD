# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Maintainer:  cclin<cclinet@outlook.com>

_pkgname="otel-tui"
pkgname="${_pkgname}-bin"
pkgver=0.5.5
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
#source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_x86_64.tar.gz")
sha256sums_aarch64=('6f198cbe23830cec0192ec86663f3977207371db014dde70fd39a946482eadc4')
sha256sums_x86_64=('a2a90214643b9d1762f08fd8d68361b6b538c78f826990505fd52a348e387e5a')
#sha256sums_i686=('31b5ff706871a3cda4cf10ed0c539fb7464cee0664149d47e4d56b58027726e8')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
