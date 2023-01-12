# Maintainer: Markus Engel <markus_aur@familie-engel.online>

pkgname=vlc-plugin-ytdl-git
pkgver=0.r2.bd233b1
pkgrel=1
pkgdesc='VLC plugin for youtube-dl'
arch=('any')
url='https://git.remlab.net/gitweb/?p=vlc-plugin-ytdl.git;a=blob;f=README'
license=('LGPL')
depends=('yt-dlp' 'vlc')
provides=('vlc-plugin-ytdl')
conflicts=('vlc-plugin-ytdl')
source=('git+https://git.remlab.net/git/vlc-plugin-ytdl.git')
sha256sums=('SKIP')

build() {
  cd vlc-plugin-ytdl
  make
}

package() {
  cd vlc-plugin-ytdl

  install -dm 755 "$pkgdir"/usr/lib/vlc/plugins/access
  cp -dr --no-preserve='ownership' libytdl_plugin.so "$pkgdir"/usr/lib/vlc/plugins/access/

  install -dm 755 "$pkgdir"/usr/share/vlc
  cp -dr --no-preserve='ownership' src/ytdl-extract.py "$pkgdir"/usr/share/vlc/
}

