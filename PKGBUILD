# Maintainer: Naomi Calabretta <me@arytonex.pw>

pkgname=sunamu-bin
_pkgver=v1.3.0
pkgver=${_pkgver#v}
pkgrel=1
pkgdesc="Show your currently playing song in a stylish way! (Binary version)"
url="https://github.com/NyaomiDEV/Sunamu"
license=("MPL-2.0")
arch=("x86_64" "i686" "armv7h" "aarch64")
conflicts=(sunamu sunamu-git)
depends=(c-ares ffmpeg gtk3 http-parser libevent libvpx libxslt libxss minizip nss re2 snappy libnotify libappindicator-gtk3)

source_x86_64=("sunamu.pacman::$url/releases/download/${_pkgver}/sunamu-${pkgver}.pacman")
sha256sums_x86_64=("64295d4cf55b9ea82ffb24a4a5ae724f377aeda4a566378e5471a72da994c359")

source_i686=("sunamu.pacman::$url/releases/download/${_pkgver}/sunamu-${pkgver}-i686.pacman")
sha256sums_i686=("c106a3926a0e4f920385e472e4d40539e9f99e83870bd12ac5653cc7c5b151b4")

source_armv7h=("sunamu.pacman::$url/releases/download/${_pkgver}/sunamu-${pkgver}-armv7l.pacman")
sha256sums_armv7h=("0079754717e90c0c6a86e742646b8255199326c3fe4b1144a9b4863734c248fd")

source_aarch64=("sunamu.pacman::$url/releases/download/${_pkgver}/sunamu-${pkgver}-aarch64.pacman")
sha256sums_aarch64=("3308b2b6b5f580690a9c2061fbc9f3463665a3f5433e357d094b8597e3a77f2d")

noextract=("sunamu.pacman")
options=(!strip)

package() {
  tar -xJv -C "${pkgdir}" -f "${srcdir}/sunamu.pacman" usr opt
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/Sunamu/Sunamu" "$pkgdir/usr/bin/sunamu"
}
