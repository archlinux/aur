# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=colima-bin
pkgver=0.5.2
pkgrel=6
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
sha256sums_x86_64=('cb865ff0f5c7bb26929ca98143fb35b638eab543b629cdd386f7cd111425113a')
sha256sums_aarch64=('a707b297d40b45e113d00a46317b881111f8f10d5378a0eb333d3d2145d129b5')

package() {
  cd "${srcdir}"
  install -Dm755 ${pkgname%-bin}-Linux-${arch} ${pkgdir}/usr/bin/${pkgname%-bin}
  install -D -m 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
