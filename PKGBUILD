# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="ziggy"
pkgname="${_pkgname}-bin"
pkgver=0.0.1
pkgrel=1
pkgdesc="A data serialization language for expressing clear API messages, config files, etc"
arch=(
  'aarch64'
  'x86_64'
)
url="https://ziggy-lang.io"
_url="https://github.com/kristoff-it/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${_url}/raw/refs/tags/${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64.tar.xz::${_url}/releases/download/${pkgver}/aarch64-linux.tar.xz.test.xz")
source_x86_64=("${_pkgsrc}-x86_64.tar.xz::${_url}/releases/download/${pkgver}/x86_64-linux-musl.tar.xz")
sha256sums=('40e257860b7b66fcf8d0c9688c87d7f2174bef4cf89c6bfb6a48fe786c9ec300'
            'fce6401325da3777483f1567966de44f712d71bb5c7dcfc5cd15e292b968a7a2')
sha256sums_aarch64=('299003e3668f841c51eb4afc1861da952ad88166480999226f4abfee65f71885')
sha256sums_x86_64=('71c583b9971ac8712a193f15757edc6a3f058a705cf74922c966611d0a866585')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${CARCH}-linux"* 
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
