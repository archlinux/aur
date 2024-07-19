# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="drand"
pkgname="${_pkgname}-bin"
pkgver=2.0.2
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
sha256sums_x86_64=('ada195439020a4ab6188d295ed6ce39e244124164933edb89da81872a35fbeb2')
sha256sums_i686=('4d24d64dae6447e250ed50a12312b680d517690afe98026626679de200738fcc')
sha256sums_aarch64=('963f5825310f31180a7df23d518b646bf3cff49f611fb69070867001f7f91651')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE-2.0"
  install -Dm644 "LICENSE-MIT" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
}
