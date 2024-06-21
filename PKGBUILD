# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname=geek-life
pkgname=${_pkgname}-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="The CLI To-Do List / Task Manager for Geeks"
arch=('x86_64' 'aarch64')
url="https://github.com/ajaxray/${_pkgname}"
license=('MIT')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${url}/raw/v${pkgver}/README.md"
        "${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}::${url}/releases/download/v${pkgver}/${_pkgname}_linux-amd64")
source_aarch64=("${_pkgsrc}::${url}/releases/download/v${pkgver}/${_pkgname}_linux-arm64")
sha256sums=('d045e6fa7556b2991dda0cc378c3b8fe54168649d0a6a5256d159a073bc3add0'
            '4dc3bfa897198794928f7d9667394f29f8ebcf6c35deba8ff00ed8d4c22e64d2')
sha256sums_x86_64=('bf8ea9c7df37adb18db10a015cf485d63b06bab488a04a71f1ddd8732c3c3d70')
sha256sums_aarch64=('5dde0fa9f635b830b16adc0faa1d85a613ff08e307cfecfd51b836f8c1e7d33a')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgsrc}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}