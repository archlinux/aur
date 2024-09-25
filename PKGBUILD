# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="drand"
pkgname="${_pkgname}-bin"
pkgver=2.0.4
pkgrel=1
pkgdesc="A Distributed Randomness Beacon Daemon"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/${_pkgname}/${_pkgname}"
license=('Apache-2.0' 'MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('9e69ed1dac6521d1143975d0a5adb8f2ba760733aa003e10c57076b2905f0444')
sha256sums_i686=('4cb4b7469878a7f63b9a61143805b15ffeb2adaa54cecff0925aa86a0f55343d')
sha256sums_aarch64=('22fff76fb2d226da916583c1127fd0e6a273b5bbdf69b94d1397d28dd428e2bd')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}"    "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"      "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE-2.0"
  install -Dm644 "LICENSE-MIT"    "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
}
