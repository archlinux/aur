# Maintainer: Markus Engel <markus_aur@familie-engel.online>

pkgname=vlc-plugin-ytdl-git
pkgver=0.r1.6d5fdda82
pkgrel=1
pkgdesc='VLC plugin for youtube-dl'
arch=('any')
url='https://git.remlab.net/gitweb/?p=vlc-plugin-ytdl.git;a=blob;f=README'
license=('LGPL')
depends=('youtube-dl' 'vlc')
makedepends=('git')
provides=('vlc-plugin-ytdl')
conflicts=('vlc-plugin-ytdl')
options=('!strip')
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
}

