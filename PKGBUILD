# Maintainer: Naomi Calabretta <me@arytonex.pw>

pkgname=sunamu-bin
_pkgver=v2.0.0
pkgver=${_pkgver#v}
pkgrel=2
pkgdesc="Show your currently playing song in a stylish way! (Binary version)"
url="https://github.com/NyaomiDEV/Sunamu"
license=("MPL-2.0")
arch=("x86_64" "aarch64")
conflicts=(sunamu sunamu-git)
depends=(c-ares ffmpeg gtk3 http-parser libevent libvpx libxslt libxss minizip nss re2 snappy libnotify libappindicator-gtk3 libvips)

source_x86_64=("sunamu.pacman::$url/releases/download/${_pkgver}/sunamu-${pkgver}.pacman")
sha256sums_x86_64=("5e978f7f0caa601c77851b82e3e0bcb48dd084dc3851365b7b32369f7c50dcd7")

source_aarch64=("sunamu.pacman::$url/releases/download/${_pkgver}/sunamu-${pkgver}-aarch64.pacman")
sha256sums_aarch64=("63cdf1bd99c6e7467d29705110d5b960f68d1057e8fda23e599c857d223701bb")

noextract=("sunamu.pacman")
options=(!strip)

package() {
  tar -xJv -C "${pkgdir}" -f "${srcdir}/sunamu.pacman" usr opt
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/Sunamu/Sunamu" "$pkgdir/usr/bin/sunamu"
}
