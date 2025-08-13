# Maintainer: knedl1k <knedl1k At tuta Dot io>
# Contributor: yukichan

pkgname=yuki-iptv
pkgver=0.0.19
pkgrel=1
pkgdesc="IPTV player with EPG support"
arch=('any')
url="https://codeberg.org/liya/yuki-iptv"
license=('GPL3')
makedepends=('make')
depends=('python' 'qt6-base' 'mpv' 'python-pyqt6' 'python-pillow' 'ffmpeg'
         'python-gobject' 'python-unidecode'
         'python-requests' 'python-chardet' 'python-setproctitle')
optdepends=('yt-dlp: YouTube channel support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('1bc6be13b6ba1ff6b88e2abeb1b340d70cc89061218e882daf1061719a84b40f')

prepare(){
  cd "${pkgname}"

  #set version in About dialog
  sed -i "s/__DEB_VERSION__/${pkgver//+*/}/g" usr/lib/yuki-iptv/yuki-iptv.py
}

build(){
  cd "${pkgname}"
  make
}

package(){
  cd "${pkgname}"
  cp -r usr/ "$pkgdir/"
}
