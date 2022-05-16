# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=colima
pkgver=0.4.0
pkgrel=4
pkgdesc="Container runtimes on macOS (and Linux) with minimal setup."
arch=('x86_64')
url="https://github.com/abiosoft/colima"
license=('MIT')
source=(
  "https://github.com/abiosoft/${pkgname}/releases/download/v${pkgver}/${pkgname}-Linux-x86_64"
  "https://raw.githubusercontent.com/abiosoft/colima/v${pkgver}/LICENSE"
)
sha256sums=('76fb5f3de0bee3d3b7baee1374be746c618a90d6aa1426c668dfe4b172cfa6af'
            'e5ce0844732e29a77f349cc332fcb6ab75617393f9e565ac6509c7b681d95eea')

package() {
  cd "${srcdir}"
  install -Dm755 ${pkgname}-Linux-x86_64 ${pkgdir}/usr/bin/${pkgname}
  install -D -m 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
