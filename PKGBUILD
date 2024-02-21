# Maintainer: Amolith <amolith@secluded.site>
pkgname="backblaze-b2-bin"
pkgver=3.16.0
_pkgid="${pkgname%-bin}-${pkgver}"
pkgrel=1
pkgdesc="Backblaze B2 Command Line Client"
arch=('x86_64')
url="https://github.com/Backblaze/B2_Command_Line_Tool"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

sha256sums_x86_64=('4a1eee321045952de574f71b57251b783fa79d8596d0bf7c9a23a5e0c751a11d')
source_x86_64=("b2-linux"::"${url}/releases/download/v${pkgver}/b2-linux")

prepare() {
  chmod +x b2-linux
}

package() {
  mkdir -p "${pkgdir}/usr/local/bin/"
  cp "${srcdir}/b2-linux" "${pkgdir}/usr/local/bin/b2"
}
