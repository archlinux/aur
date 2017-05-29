# Maintainer:  Ainola
# Contributor: Hugo Lobo

pkgname=binkplayer
pkgver=2.7a
pkgrel=1
pkgdesc="Bink Video Player"
url="http://www.radgametools.com/bnkmain.htm"
arch=('i686' 'x86_64')
depends=('sdl' 'openal')
depends_i686=('gcc-libs')
# AUR helpers get confused with cached versions if the file name never changes.
source=("BinkLinuxPlayer-$pkgver.7z"::"http://www.radgametools.com/down/Bink/BinkLinuxPlayer.7z")
sha256sums=('477f723159e4eb580f5cc42e30fa8bb2beafc44fb0d0ebc26fd923c5a10567b7')
license=('custom')

package() {
  if [[ "$CARCH" == "x86" ]]; then
    install -Dm755 "${srcdir}/BinkPlayer" "${pkgdir}/usr/bin/binkplayer"
  elif [[ "$CARCH" == "x86_64" ]]; then
    install -Dm755 "${srcdir}/BinkPlayer64" "${pkgdir}/usr/bin/binkplayer"
  fi
}

# vim: et sw=2 ts=2
