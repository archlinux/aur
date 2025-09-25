# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=colima-bin
pkgver=0.9.1
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
            '81d986638d530ddc9372f6aa2459065b6c407d880f2866a3cb271a3c51ac5f60')

package() {
  cd "${srcdir}"
  install -Dm755 ${pkgname%-bin}-Linux-x86_64 ${pkgdir}/usr/bin/${pkgname%-bin}
  install -D -m 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
