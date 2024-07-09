# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="m8c"
pkgname="${_pkgname}-bin"
pkgver=1.7.6
pkgrel=1
pkgdesc="A UI for the M8 and M8 Headless portable music DAWs"
arch=('x86_64')
url="https://github.com/laamaa/${_pkgname}"
license=('MIT')
depends=('glibc' 'sdl2' 'libserialport')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-2024-07-08-linux.zip")
sha256sums_x86_64=('cfaab35dea34e8926e148c67b686cdc300b824bb0765612557b6624cf248c511')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "AUDIOGUIDE.md" "${pkgdir}/usr/share/doc/${_pkgname}/AUDIOGUIDE.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "gamecontrollerdb.txt" "${pkgdir}/usr/share/doc/${_pkgname}/gamecontrollerdb.txt"
}
