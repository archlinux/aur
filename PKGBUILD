# Maintainer:  Ainola
# Contributor: Hugo Lobo

pkgname=binkplayer
pkgver=2.6h
pkgrel=1
pkgdesc="Bink Video Player"
url="http://www.radgametools.com/bnkmain.htm"
arch=('i686' 'x86_64')
depends=('sdl' 'openal')
depends_i686=('gcc-libs')
# AUR helpers get confused with cached versions if the file name never changes.
source=("BinkLinuxPlayer-$pkgver.7z"::"http://www.radgametools.com/down/Bink/BinkLinuxPlayer.7z")
sha256sums=('2e204ec164fe5423b45c2455e3d314f988fb51671cc29496cc85028cef482e7f')
license=('custom')

package() {
  if [[ "$CARCH" == "x86" ]]; then
    install -Dm755 "${srcdir}/BinkPlayer" "${pkgdir}/usr/bin/binkplayer"
  elif [[ "$CARCH" == "x86_64" ]]; then
    install -Dm755 "${srcdir}/BinkPlayer64" "${pkgdir}/usr/bin/binkplayer"
  fi
}

# vim: et sw=2 ts=2
