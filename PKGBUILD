# Maintainer: Amolith <amolith@secluded.site>
pkgname="backblaze-b2-bin"
pkgver=4.3.1
_pkgid="${pkgname%-bin}-${pkgver}"
pkgrel=1
pkgdesc="Backblaze B2 Command Line Client"
arch=('x86_64')
url="https://github.com/Backblaze/B2_Command_Line_Tool"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source=("b2-linux"::"${url}/releases/download/v${pkgver}/b2-linux")
b2sums=('978bb69d81d68111851636066e37a1a5f2dab6e709adfbda646f9764843373eb27943aabbcab1877b1c5b12af3440203c7fae218765dc888ceb1841997e98617')

prepare() {
  chmod +x b2-linux
}

package() {
  install -Dm755 b2-linux "$pkgdir/usr/bin/bbb2"
}
