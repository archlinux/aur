# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="radiogogo"
pkgname="${_pkgname}-bin"
pkgver=0.4.0
pkgrel=1
pkgdesc="Go-powered CLI to surf global radio waves via a sleek TUI"
arch=(
  'aarch64'
  'armv6h'
  'armv7h'
  'i686'
  'x86_64'
)
url="https://github.com/matteo-pacini/RadioGoGo"
license=(
  'MIT'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_aarch64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip"
)
source_armv6h=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.zip"
)
source_armv7h=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv7.zip"
)
source_i686=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.zip"
)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip"
)
sha256sums=('1f0822bd042789976313ee09b475e0799ac8d2f9402aa193c10fb5b31cfd5ceb'
            '133e7fe753e0ab27fa19a01aa7710821442c19e80024642b190adbdd2d9c97d2')
sha256sums_aarch64=('a98155c82e813d74e3df4bdeabe753db884f9de298f9e5fcfd426d467bebeba5')
sha256sums_armv6h=('25e56890d5f3a9e1623bc79a17ddbb7a2eb468508014a5aca20c0c257018f7ff')
sha256sums_armv7h=('38b0978a12d52ef0efcdfe8928ce1a1e15d230b8c7b76e3eeac986f884b9bdc7')
sha256sums_i686=('880e48c9f0ab3ebcd0a543c9b6aa3be5096548a9f7da2ad5b9dab0153d27723d')
sha256sums_x86_64=('4676c40ad109a6c18a93296aca64c54ebeb96f0dbec6bba5803a28db68b15add')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
