# Contributor: Michael Straube <straubem gmx de>

pkgname=vlc-extension-lyricsfinder-git
pkgver=0.3.4.1.r1.gf188356
pkgrel=1
pkgdesc='VLC media player lyrics extension'
arch=('any')
url='https://github.com/Smile4ever/VLC-Lyrics-Finder'
license=('GPL')
depends=('vlc')
makedepends=('git')
source=("git+https://github.com/Smile4ever/VLC-Lyrics-Finder.git")
sha1sums=('SKIP')

pkgver() {
  cd VLC-Lyrics-Finder

  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd VLC-Lyrics-Finder

  install -Dm644 lyricsfinder.lua "$pkgdir"/usr/lib/vlc/lua/extensions/lyricsfinder.lua

  install -d "$pkgdir"/usr/share/vlc/lua/extensions/lyricsfinder/locale
  install -m644 locale/*.xml "$pkgdir"/usr/share/vlc/lua/extensions/lyricsfinder/locale
}
