# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="scorecard"
pkgname="${_pkgname}-bin"
pkgver=5.1.0
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
sha256sums_aarch64=('d4d145294ad9e31e1d095d7645cf2679e1af3455de92943eefa9dcb64053bef6')
sha256sums_x86_64=('168f57ab180c2f1f0b5a7eb1fdc6a7d85bac9f7c751424005f1e762af152c257')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
