# Maintainer: Naomi Calabretta <me@arytonex.pw>

pkgname=sunamu-bin
_pkgver=v2.1.0
pkgver=${_pkgver#v}
pkgrel=1
pkgdesc="Show your currently playing song in a stylish way! (Binary version)"
url="https://github.com/NyaomiDEV/Sunamu"
license=("MPL-2.0")
arch=("x86_64" "aarch64")
conflicts=(sunamu sunamu-git)
depends=(c-ares ffmpeg gtk3 http-parser libevent libvpx libxslt libxss minizip nss re2 snappy libnotify libappindicator-gtk3 libvips)

source_x86_64=("sunamu.pacman::$url/releases/download/${_pkgver}/sunamu-${pkgver}.pacman")
sha256sums_x86_64=("52d85840318b06a56f112076c470ec31d41a30fe52b7fdd66aa6053f82f0a499")

source_aarch64=("sunamu.pacman::$url/releases/download/${_pkgver}/sunamu-${pkgver}-aarch64.pacman")
sha256sums_aarch64=("57cd34898227917f7d38897f14095be26f17878ff3f6ea9069fbf4d2fcf2b1eb")

noextract=("sunamu.pacman")
options=(!strip)

package() {
  tar -xJv -C "${pkgdir}" -f "${srcdir}/sunamu.pacman" usr opt
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/Sunamu/Sunamu" "$pkgdir/usr/bin/sunamu"
}
