# Maintainer: Michael Straube <michael_straube web de>

pkgname=vlc-extension-lyricsfinder-git
pkgver=0.3.2.r23.ga5a4321
pkgrel=1
pkgdesc='VLC media player lyrics extension'
arch=('any')
url='https://github.com/Smile4ever/VLC-Lyrics-Finder'
license=('GPL')
depends=('vlc')
source=("git+https://github.com/Smile4ever/VLC-Lyrics-Finder.git")
sha1sums=('SKIP')

pkgver() {
  cd VLC-Lyrics-Finder

  git describe --long | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd VLC-Lyrics-Finder

  install -D -m 644 lyricsfinder.lua "$pkgdir/usr/lib/vlc/lua/extensions/lyricsfinder.lua"

  install -d -m 755 "$pkgdir/usr/share/vlc/lua/extensions/lyricsfinder/locale"
  install -m 644 locale/*.xml "$pkgdir/usr/share/vlc/lua/extensions/lyricsfinder/locale/"
}
