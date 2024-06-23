# Maintainer: knedl1k <knedl1k At tuta Dot io>
# Contributor: yukichan

pkgname=yuki-iptv
pkgver=0.0.11
pkgrel=2
pkgdesc="IPTV player with EPG support (Astroncia IPTV fork)"
arch=('any')
url="https://codeberg.org/liya/yuki-iptv"
license=('GPL3')
makedepends=('make')
depends=('python' 'qt6-base' 'mpv' 'python-pyqt6' 'python-pillow' 'python-gobject' 'python-unidecode'
         'python-requests' 'python-chardet' 'python-setproctitle' 'python-pydbus' 'python-wand' 'ffmpeg')
optdepends=('yt-dlp: YouTube channel support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('5f587ec490eedc108d6549befad9e8564b8304837cf2275fd1a07cf8beeef6be')

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
