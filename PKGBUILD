# Maintainer: Ricardo Gonçalves <ricardompgoncalves@gmail.com>

pkgname=qmmp-plugin-youtube
pkgver=0.2
pkgrel=1
pkgdesc="Plugin for Qt-based Multimedia Player (Qmmp) to search and play musics directly from YouTube"
arch=('i686' 'x86_64')
url="https://github.com/rigon/qmmp-plugin-youtube"
license=('GPL')
depends=('qmmp' 'python>=3.5' 'python<3.6' 'youtube-dl' 'qjson' 'pythonqt')
source=("https://github.com/rigon/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('52504d92695f2e5c9a9fab338062b4d9')

build() {
  cd "$pkgname-$pkgver"/
  
  qmake
  make -j4
}

package() {
  mkdir -p "$pkgdir"/usr/lib/qmmp/Transports
  cp "$pkgname-$pkgver"/libyoutube.so "$pkgdir"/usr/lib/qmmp/Transports/
  
  # This is very hacky!!
  mkdir -p "$pkgdir"/usr/lib/qmmp/General
  cp "$pkgname-$pkgver"/libyoutube.so "$pkgdir"/usr/lib/qmmp/General/
}

