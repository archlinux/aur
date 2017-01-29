# Maintainer:  Ainola
# Contributor: Hugo Lobo

pkgname=binkplayer
pkgver=2.6e
pkgrel=1
pkgdesc="Bink Video Player"
url="http://www.radgametools.com/bnkmain.htm"
arch=('i686' 'x86_64')
depends=('sdl' 'openal')
depends_i686=('gcc-libs')
# AUR helpers get confused with cached versions if the file name never changes.
source=("BinkLinuxPlayer-$pkgver.7z"::"http://www.radgametools.com/down/Bink/BinkLinuxPlayer.7z")
sha256sums=('6a5ff4e2b0d3e4536c1f09aa5b188703de65c3044abd3aa567e5b60bb768f951')
license=('custom')

package() {
  if [[ "$CARCH" == "x86" ]]; then
    install -Dm755 "${srcdir}/BinkPlayer" "${pkgdir}/usr/bin/binkplayer"
  elif [[ "$CARCH" == "x86_64" ]]; then
    install -Dm755 "${srcdir}/BinkPlayer64" "${pkgdir}/usr/bin/binkplayer"
  fi
}

# vim: et sw=2 ts=2
