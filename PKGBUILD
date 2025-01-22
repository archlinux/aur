# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="bit"
pkgname="${_pkgname}-bin"
pkgver=1.1.2
pkgrel=1
pkgdesc="A modern Git CLI"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/chriswalz/${_pkgname}"
license=('Apache-2.0')
depends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_arm64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_386.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgsrc//-/_}_linux_amd64.tar.gz")
sha256sums_aarch64=('464bf310947d39d873d13ef9506af9a7e358f41d25aacb6778e999505060c568')
sha256sums_i686=('11e50b6238033da036e03cd8e714ef3bcd8dd6d17a2ec821d5feb4017bc66404')
sha256sums_x86_64=('91ddf917eef0b76ddcbba6d95193479807df093d8b731c0f96dff29974acf2d5')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
