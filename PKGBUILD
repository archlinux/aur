# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

_pkggit=colima

pkgname=colima-bin
pkgver=0.4.4
pkgrel=2
pkgdesc="Container runtimes on macOS (and Linux) with minimal setup."
arch=('x86_64')
url="https://github.com/abiosoft/colima"
conflicts=('colima')
provides=('colima')
license=('MIT')
source=(
  "https://github.com/abiosoft/${_pkggit}/releases/download/v${pkgver}/${_pkggit}-Linux-x86_64"
  "https://raw.githubusercontent.com/abiosoft/${_pkggit}/v${pkgver}/LICENSE"
)
sha256sums=('65e972d13337c6505e50f60bcfbe220b92a4a8769bbcd996f9bf0e1d3e4411c6'
            'e5ce0844732e29a77f349cc332fcb6ab75617393f9e565ac6509c7b681d95eea')

package() {
  cd "${srcdir}"
  install -Dm755 ${_pkggit}-Linux-x86_64 ${pkgdir}/usr/bin/${_pkggit}
  install -D -m 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
