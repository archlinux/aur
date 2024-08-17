# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="m8c"
pkgname="${_pkgname}-bin"
pkgver=1.7.7
pkgrel=1
pkgdesc="A UI for the M8 and M8 Headless portable music DAWs"
arch=('x86_64')
url="https://github.com/laamaa/${_pkgname}"
license=('MIT')
depends=('glibc' 'sdl2' 'libserialport')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-2024-08-16-linux.zip")
sha256sums_x86_64=('4cc59fc8e81f4cead47badc2ad672c0b486acb4fa3d7cc86b321e660efcab97e')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}"   "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"     "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "AUDIOGUIDE.md" "${pkgdir}/usr/share/doc/${_pkgname}/AUDIOGUIDE.md"
  install -Dm644 "gamecontrollerdb.txt" "${pkgdir}/usr/share/doc/${_pkgname}/gamecontrollerdb.txt"
  install -Dm644 "LICENSE"       "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
