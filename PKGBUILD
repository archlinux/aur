# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="omm"
pkgname="${_pkgname}-bin"
pkgver=0.5.0
pkgrel=1
pkgdesc="A keyboard-driven task manager for the command line"
arch=('x86_64' 'i686' 'aarch64')
url="https://tools.dhruvs.space/${_pkgname}"
_url="https://github.com/dhth/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('c2d3fac9c9bd6814ad9ac936b953a700a19383b9c38bcd8e5974324933763665')
sha256sums_i686=('4e09df2f910a4e7c5e824b6525c6414cf06de1e849212c1a91ad7fc0f0901df8')
sha256sums_aarch64=('12a6ed46d146846a510aeb94cee566c340feeaeefbfa949f0d154abc7c476ac8')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
