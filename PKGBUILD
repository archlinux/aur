# Maintainer: Naomi Calabretta <me@arytonex.pw>

pkgname=sunamu-bin
_pkgver=v1.2.0
pkgver=${_pkgver#v}
pkgrel=1
pkgdesc="Show your currently playing song in a stylish way! (Binary version)"
url="https://github.com/AryToNeX/Sunamu"
license=("MPL-2.0")
arch=("x86_64" "i686" "armv7h" "aarch64")
conflicts=(sunamu sunamu-git)
depends=(c-ares ffmpeg gtk3 http-parser libevent libvpx libxslt libxss minizip nss re2 snappy libnotify libappindicator-gtk3)

source_x86_64=("sunamu.pacman::$url/releases/download/${_pkgver}/sunamu-${pkgver}.pacman")
sha256sums_x86_64=("745b69575ddebd99384871891abe9e1a2d575071dc78b402a60ccdbdf3fb3862")

source_i686=("sunamu.pacman::$url/releases/download/${_pkgver}/sunamu-${pkgver}-i686.pacman")
sha256sums_i686=("949d9cc69bcb0a7b58047239040b06db2d1a6e5856b20f9491f09bc0dd327b6c")

source_armv7h=("sunamu.pacman::$url/releases/download/${_pkgver}/sunamu-${pkgver}-armv7l.pacman")
sha256sums_armv7h=("c283cb8c5558bd1e5fb0a891fe1fea7de056ee958d339a783113f08ff589964d")

source_aarch64=("sunamu.pacman::$url/releases/download/${_pkgver}/sunamu-${pkgver}-aarch64.pacman")
sha256sums_aarch64=("2ac0f8cbae2ab0ce485e48b30d44a469834534c44d98ac008b128b5d57b2505c")

noextract=("sunamu.pacman")
options=(!strip)

package() {
  tar -xJv -C "${pkgdir}" -f "${srcdir}/sunamu.pacman" usr opt
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/Sunamu/Sunamu" "$pkgdir/usr/bin/sunamu"
}
