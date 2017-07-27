# Maintainer:  Ainola
# Contributor: Hugo Lobo

pkgname=binkplayer
pkgver=2.7b
pkgrel=1
pkgdesc="Bink Video Player"
url="http://www.radgametools.com/bnkmain.htm"
arch=('i686' 'x86_64')
depends=('libgl' 'openal')
depends_i686=('gcc-libs')
# AUR helpers get confused with cached versions if the file name never changes.
source=("BinkLinuxPlayer-$pkgver.7z"::"http://www.radgametools.com/down/Bink/BinkLinuxPlayer.7z")
sha256sums=('3be76ecfb47411356bf8c6dca3f575f843e5f04b906ce22fc68b1e36a0a296e1')
license=('custom')

package() {
  if [[ "$CARCH" == "x86" ]]; then
    install -Dm755 "${srcdir}/BinkPlayer" "${pkgdir}/usr/bin/binkplayer"
  elif [[ "$CARCH" == "x86_64" ]]; then
    install -Dm755 "${srcdir}/BinkPlayer64" "${pkgdir}/usr/bin/binkplayer"
  fi
}

# vim: et sw=2 ts=2
