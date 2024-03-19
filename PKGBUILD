# Maintainer: knedl1k <knedl1k At tuta Dot io>
# Contributor: yukichan

pkgname=yuki-iptv
pkgver=0.0.10
pkgrel=1
pkgdesc="IPTV player with EPG support (Astroncia IPTV fork)"
arch=('any')
url="https://codeberg.org/Ame-chan-angel/yuki-iptv"
license=('GPL3')
makedepends=('make')
depends=('python' 'qt6-base' 'mpv' 'python-pyqt6' 'python-pillow' 'python-gobject' 'python-unidecode'
         'python-requests' 'python-chardet' 'python-setproctitle' 'python-pydbus' 'python-wand' 'ffmpeg')
optdepends=('yt-dlp: YouTube channel support')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('6317061270625a71956739fd35e0c4dec5d63c8bd8b2af881cfdcd26e40b9ce0')

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
