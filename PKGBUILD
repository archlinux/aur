# Maintainer: Naomi Calabretta <me@arytonex.pw>

pkgname=sunamu-bin
_pkgver=v2.0.0
pkgver=${_pkgver#v}
pkgrel=1
pkgdesc="Show your currently playing song in a stylish way! (Binary version)"
url="https://github.com/NyaomiDEV/Sunamu"
license=("MPL-2.0")
arch=("x86_64" "aarch64")
conflicts=(sunamu sunamu-git)
depends=(c-ares ffmpeg gtk3 http-parser libevent libvpx libxslt libxss minizip nss re2 snappy libnotify libappindicator-gtk3)

source_x86_64=("sunamu.pacman::$url/releases/download/${_pkgver}/sunamu-${pkgver}.pacman")
sha256sums_x86_64=("174ef4d9f31ae69b8362857ea1b9e166bfb9638dbef861095f3d556c52726937")

source_aarch64=("sunamu.pacman::$url/releases/download/${_pkgver}/sunamu-${pkgver}-aarch64.pacman")
sha256sums_aarch64=("1b9252fb6667d372b19ab7ba90f3308c8f0ab895a5bab0c49e2fbd9e5fa88899")

noextract=("sunamu.pacman")
options=(!strip)

package() {
  tar -xJv -C "${pkgdir}" -f "${srcdir}/sunamu.pacman" usr opt
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/Sunamu/Sunamu" "$pkgdir/usr/bin/sunamu"
}
