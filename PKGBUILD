# Maintainer: Amolith <amolith@secluded.site>
pkgname="backblaze-b2-bin"
pkgver=4.3.0
_pkgid="${pkgname%-bin}-${pkgver}"
pkgrel=1
pkgdesc="Backblaze B2 Command Line Client"
arch=('x86_64')
url="https://github.com/Backblaze/B2_Command_Line_Tool"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source=("b2-linux"::"${url}/releases/download/v${pkgver}/b2-linux")
b2sums=('3d747dad27f23151b444bec1607f8432637320ba62781cf35b85e2e23d9224ad999b745aa946b0d501dfc0f35ed6e03a9a1b26c3ab8efb5ce9fb56d6698429bc')

prepare() {
  chmod +x b2-linux
}

package() {
  install -Dm755 b2-linux "$pkgdir/usr/bin/bbb2"
}
