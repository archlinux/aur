# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=colima-bin
pkgver=0.4.6
pkgrel=5
pkgdesc="Container runtimes on macOS (and Linux) with minimal setup."
arch=('x86_64' 'arm64')
url="https://github.com/abiosoft/colima"
conflicts=('colima')
provides=('colima')
license=('MIT')

source=("https://raw.githubusercontent.com/abiosoft/${pkgname%-bin}/v${pkgver}/LICENSE")
source_x86_64=("https://github.com/abiosoft/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}-Linux-x86_64")
source_aarch64=("https://github.com/abiosoft/${pkgname%-bin}/releases/download/v${pkgver}/${pkgname%-bin}-Linux-aarch64")

sha256sums=('e5ce0844732e29a77f349cc332fcb6ab75617393f9e565ac6509c7b681d95eea')
sha256sums_x86_64=('65e972d13337c6505e50f60bcfbe220b92a4a8769bbcd996f9bf0e1d3e4411c6')
sha256sums_aarch64=('8a72979fa0aadfb48758a5bcc4b879109cb7eaba89218fcd8c4de9a6db37ba87')

package() {
  cd "${srcdir}"
  install -Dm755 ${pkgname%-bin}-Linux-${arch} ${pkgdir}/usr/bin/${pkgname%-bin}
  install -D -m 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
