pkgname="backblaze-b2-bin"
pkgver=3.5.0
_pkgid="${pkgname%-bin}-${pkgver}"
pkgrel=1
pkgdesc="Backblaze B2 Command Line Client"
arch=('x86_64')
url="https://github.com/Backblaze/B2_Command_Line_Tool"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

sha256sums_x86_64=('577a06e0b229f57fffee01db348f19b8603857725bea0e682a4650f99bae21fe')
source_x86_64=("b2-linux"::"${url}/releases/download/v${pkgver}/b2-linux")

prepare() {
  chmod +x b2-linux
}

package() {
  mkdir -p "${pkgdir}/usr/local/bin/"
  cp "${srcdir}/b2-linux" "${pkgdir}/usr/local/bin/b2"
}
