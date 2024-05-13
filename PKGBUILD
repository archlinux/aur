# Maintainer: Amolith <amolith@secluded.site>
pkgname="backblaze-b2-bin"
pkgver=4.0.0
_pkgid="${pkgname%-bin}-${pkgver}"
pkgrel=1
pkgdesc="Backblaze B2 Command Line Client"
arch=('x86_64')
url="https://github.com/Backblaze/B2_Command_Line_Tool"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source=("b2-linux"::"${url}/releases/download/v${pkgver}/b2-linux")
b2sums=('602ae8a8b775f92e216cfdc6157f8eb164d1c24788a459ca7cf456d410dcb0f87a767356b6158c22d5a9d04b4e8f2fa4cc78329792a3debd1c1ae789d820ed5c')

prepare() {
  chmod +x b2-linux
}

package() {
  install -Dm755 b2-linux "$pkgdir/usr/bin/bbb2"
}
