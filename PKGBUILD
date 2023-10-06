# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=colima-bin
pkgver=0.5.6
pkgrel=1
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
sha256sums_x86_64=('8d02d2f7ae3454f1a97536a68f9153bdc67480acc47c9c6af9e8deb0cf3e3ea7')
sha256sums_aarch64=('a0752de3bc385919dfb3f663560c2f825f0ec35356d8fdec9b9f602065fa8e84')

package() {
  cd "${srcdir}"
  install -Dm755 ${pkgname%-bin}-Linux-${arch} ${pkgdir}/usr/bin/${pkgname%-bin}
  install -D -m 644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
