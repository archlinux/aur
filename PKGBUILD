# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="bork"
pkgname="${_pkgname}-bin"
pkgver=0.4.0
pkgrel=1
pkgdesc="TUI chat client tailored for livecoding on Twitch"
arch=('aarch64' 'x86_64')
url="https://github.com/kristoff-it/${_pkgname}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64.tar.xz::${url}/releases/download/${pkgver}/aarch64-linux.tar.xz")
source_x86_64=("${_pkgsrc}-x86_64.tar.xz::${url}/releases/download/${pkgver}/x86_64-linux-musl.tar.xz")
sha256sums=('98686f12ef9358ca5e8da65efd2df39a83193f7c754a70a9295e176f317ef459'
            '1bab36151409a81fa1bfb8c71d54ba63e88247555fd22db6f5948a6f6e8f01a6')
sha256sums_aarch64=('fdf91ab3e94dcecae6e467d0ea1ee0bc92f9c946294992940ab9c33f6e3bbc32')
sha256sums_x86_64=('e4bae41715777fc74f3c93cf2a5f8badc525f1e343d9362ecf9516aa2eb89cca')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${CARCH}-linux"*
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
