# Maintainer: Amolith <amolith@secluded.site>
pkgname="backblaze-b2-bin"
pkgver=3.16.1
_pkgid="${pkgname%-bin}-${pkgver}"
pkgrel=1
pkgdesc="Backblaze B2 Command Line Client"
arch=('x86_64')
url="https://github.com/Backblaze/B2_Command_Line_Tool"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source=("b2-linux"::"${url}/releases/download/v${pkgver}/b2-linux")
b2sums=('89709b25b98ceef78653ead5e076b456949762aef444008a5b7a2aebb625fa71b122c88ac9ec9f237a53e5d0bd5ac9bec569beee36a4bd9b0810a4257c15fe9d')

prepare() {
  chmod +x b2-linux
}

package() {
  install -Dm755 b2-linux "$pkgdir/usr/bin/bbb2"
}
