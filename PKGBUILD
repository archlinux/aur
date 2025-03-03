# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="m8c"
pkgname="${_pkgname}-bin"
pkgver=1.7.10
pkgrel=1
pkgdesc="A UI for the M8 and M8 Headless portable music DAWs"
arch=('x86_64')
url="https://github.com/laamaa/${_pkgname}"
license=('MIT')
depends=('glibc' 'libserialport' 'sdl2')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.zip::${url}/releases/download/v${pkgver}/${_pkgname}-2025-03-03-linux.zip")
sha256sums_x86_64=('e9a8631ce2ebab02457d7bfe7d30572ad89c4b2541f031d82d2659663d12c34d')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "AUDIOGUIDE.md" "${pkgdir}/usr/share/doc/${_pkgname}/AUDIOGUIDE.md"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -vDm644 "gamecontrollerdb.txt" "${pkgdir}/usr/share/doc/${_pkgname}/gamecontrollerdb.txt"
}
