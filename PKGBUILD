# Maintainer: Naomi Calabretta <me@arytonex.pw>

pkgname=sunamu-bin
_pkgver=v1.1.1
pkgver=${_pkgver#v}
pkgrel=1
pkgdesc="Show your currently playing song in a stylish way! (Binary version)"
url="https://github.com/AryToNeX/Sunamu"
license=("MPL-2.0")
arch=("x86_64")
conflicts=(sunamu sunamu-git)
depends=(c-ares ffmpeg gtk3 http-parser libevent libvpx libxslt libxss minizip nss re2 snappy libnotify libappindicator-gtk3)
_filename=sunamu-${pkgver}.pacman
source=("$url/releases/download/${_pkgver}/${_filename}")
noextract=("${_filename}")
sha256sums=("b391bc2500931c50d303b24c756133364424c05a50cd22c79f8ae9e891d58fbe")
options=(!strip)

package() {
  tar -xJv -C "${pkgdir}" -f "${srcdir}/${_filename}" usr opt
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/Sunamu/Sunamu" "$pkgdir/usr/bin/sunamu"
}
