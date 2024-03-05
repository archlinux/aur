# Maintainer: knedl1k <knedl1k At tuta Dot io>
# Contributor: yukichan

pkgname=yuki-iptv
pkgver=0.0.9
pkgrel=2
pkgdesc="IPTV player with EPG support (Astroncia IPTV fork)"
arch=('any')
url="https://codeberg.org/Ame-chan-angel/yuki-iptv"
license=('GPL3')
makedepends=('make')
depends=('python' 'qt6-base' 'mpv' 'python-pyqt6' 'python-pillow' 'python-gobject' 'python-unidecode'
         'python-requests' 'python-chardet' 'python-setproctitle' 'python-pydbus' 'python-wand' 'ffmpeg')
optdepends=('yt-dlp: YouTube channel support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('6ed6589cee217eaa6728907f2263451d396e1cb82e7cec86a422bdcadbbd5f48')

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
