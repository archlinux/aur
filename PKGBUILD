# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=colima
pkgver=0.4.4
pkgrel=1
pkgdesc="Container runtimes on macOS (and Linux) with minimal setup."
arch=('x86_64')
url="https://github.com/abiosoft/colima"
license=('MIT')
source=(
  "https://github.com/abiosoft/${pkgname}/releases/download/v${pkgver}/${pkgname}-Linux-x86_64"
  "https://raw.githubusercontent.com/abiosoft/colima/v${pkgver}/LICENSE"
)
sha256sums=('65e972d13337c6505e50f60bcfbe220b92a4a8769bbcd996f9bf0e1d3e4411c6'
            'e5ce0844732e29a77f349cc332fcb6ab75617393f9e565ac6509c7b681d95eea')

package() {
  cd "${srcdir}"
  install -Dm755 ${pkgname}-Linux-x86_64 ${pkgdir}/usr/bin/${pkgname}
  install -D -m 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
