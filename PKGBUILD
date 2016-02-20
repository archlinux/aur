# Maintainer: Michael Straube <m.s.online gmx.de>
pkgname=vlc-extension-lyricsfinder-git
pkgver=0.3.2.r23.ga5a4321
pkgrel=1
pkgdesc='VLC media player lyrics extension'
arch=('any')
license=('GPL')
url='https://github.com/Smile4ever/VLC-Lyrics-Finder'
depends=('vlc')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd VLC-Lyrics-Finder
  git describe --long | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd "$srcdir/VLC-Lyrics-Finder"
  install -Dm644 lyricsfinder.lua "$pkgdir/usr/lib/vlc/lua/extensions/lyricsfinder.lua"
  mkdir -p "$pkgdir/usr/share/vlc/lua/extensions/lyricsfinder/locale"
  cp locale/*.xml "$pkgdir/usr/share/vlc/lua/extensions/lyricsfinder/locale/"
}
