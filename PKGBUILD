# Maintainer: Amolith <amolith@secluded.site>
pkgname="backblaze-b2-bin"
pkgver=3.19.1
_pkgid="${pkgname%-bin}-${pkgver}"
pkgrel=1
pkgdesc="Backblaze B2 Command Line Client"
arch=('x86_64')
url="https://github.com/Backblaze/B2_Command_Line_Tool"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source=("b2-linux"::"${url}/releases/download/v${pkgver}/b2-linux")
b2sums=('59f67f00091e7a084c5ee89ab44e21a0e2df1799f65defceea96838c3b6123f7527b8cfdbbc551b05772177b2466d13b33e4be33b4afac118bcb0aa64fd21b00')

prepare() {
  chmod +x b2-linux
}

package() {
  install -Dm755 b2-linux "$pkgdir/usr/bin/bbb2"
}
