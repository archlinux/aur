# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrawatergate@outlook.com>

_pkgname=ffmpeg-audio-thumbnailer
pkgname=$_pkgname
pkgver=1.1.0
pkgrel=1
pkgdesc="A minimal audio file thumbnailer for file managers, such as nautilus, dolphin, thunar, and nemo."
url="https://github.com/saltedcoffii/ffmpeg-audio-thumbnailer"
arch=(any)
depends=('ffmpeg')
license=('GPL3 or any later version')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('e9ce5272c0085f06bb7c35f42fbe41540a1e97de3a9229c0a9679f06ec20331d')

build() {
  cd $_pkgname-$pkgver
  make
}

check() {
  cd $_pkgname-$pkgver
  make check
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
