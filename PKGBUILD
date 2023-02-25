# Maintainer: Cassandra Watergate (saltedcoffii) <cassandrawatergate@outlook.com>

_pkgname=ffmpeg-audio-thumbnailer
pkgname=$_pkgname
pkgver=1.1.1
pkgrel=2
pkgdesc="A minimal audio file thumbnailer for file managers, such as nautilus, dolphin, thunar, and nemo."
url="https://github.com/saltedcoffii/ffmpeg-audio-thumbnailer"
arch=(any)
depends=('ffmpeg')
license=('GPL3 or any later version')
conflicts=('ffmpeg-audio-thumbnailer-git')
conflicts+=('ffmpegthumbnailer-mp3') # The files don't conflict, but the functions do (this package does it better ;) )
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('3ede2cc4341ca6e2463eecf22032f35c878ba1387ac77a63aaec323ebd6bf5806514748481254d522f426cb2027b8c460b60b433b13fc9aa21cd39d22abfaa4a')

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
