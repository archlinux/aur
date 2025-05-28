# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="scorecard"
pkgname="${_pkgname}-bin"
pkgver=5.2.0
pkgrel=1
pkgdesc="Security health metrics for Open Source"
arch=('aarch64' 'x86_64')
url="https://scorecard.dev"
_url="https://github.com/ossf/${_pkgname}"
license=('Apache-2.0')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.tar.gz")
sha256sums_aarch64=('034d7519509fb9754a669d707288eba1b5d96b48137fb0f812a441451965aa54')
sha256sums_x86_64=('73c30e6178176ac1224cf27b84d7b8597fba5a9636bc626b7fafc4e344899cef')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
