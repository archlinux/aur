# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=colima-bin
pkgver=0.8.4
pkgrel=1
pkgdesc="Container runtimes on macOS (and Linux) with minimal setup."
arch=('x86_64')
url="https://github.com/abiosoft/colima"
conflicts=('colima')
provides=('colima')
license=('MIT')

source=("https://raw.githubusercontent.com/abiosoft/${pkgname%-bin}/v${pkgver}/LICENSE"
        "https://github.com/abiosoft/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}-Linux-x86_64")

sha256sums=('e5ce0844732e29a77f349cc332fcb6ab75617393f9e565ac6509c7b681d95eea'
            'a47c8ec7fac51f50969e1fec092e6f684f57415662b173ebc10e2476861aef09')

package() {
  cd "${srcdir}"
  install -Dm755 ${pkgname%-bin}-Linux-x86_64 ${pkgdir}/usr/bin/${pkgname%-bin}
  install -D -m 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
