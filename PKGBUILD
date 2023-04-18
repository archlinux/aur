# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=colima-bin
pkgver=0.5.4
pkgrel=7
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
sha256sums_x86_64=('aee229fa9fa180d55ad8db0a8e39d35f42f3475a28ebefd73d67514e2db8eafc')
sha256sums_aarch64=('337758d535975f7f425ff7bb6afad2fcfe911e260b80dbabfc728bea4c3e8279')

package() {
  cd "${srcdir}"
  install -Dm755 ${pkgname%-bin}-Linux-${arch} ${pkgdir}/usr/bin/${pkgname%-bin}
  install -D -m 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
