# Maintainer: knedl1k <knedl1k At tuta Dot io>
# Contributor: yukichan

pkgname=yuki-iptv
pkgver=0.0.15
pkgrel=1
pkgdesc="IPTV player with EPG support"
arch=('any')
url="https://codeberg.org/liya/yuki-iptv"
license=('GPL3')
makedepends=('make')
depends=('python' 'qt6-base' 'mpv' 'python-pyqt6' 'python-pillow' 'ffmpeg'
         'python-gobject' 'python-unidecode'
         'python-requests' 'python-chardet' 'python-setproctitle' 'python-wand')
optdepends=('yt-dlp: YouTube channel support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('f2ef0aa1a6c4c55ab28fca21194976f12a8825819f34b365fedc8733d8305fcf')

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
