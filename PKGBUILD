pkgname=audioconvert
pkgrel=1
pkgver=0.4.4
pkgdesc="Audio Sync and Conversion Utility"
arch=('i686' 'x86_64' 'arm')
url="http://gogglesmm.github.io/"
license=('GPL3')
depends=('fox>=1.7.48' 'taglib' )
optdepends=('faac: for aac support'
            'faad2: for aac support'
            'flac: for flac support'
            'lame: for mp3 support'
            'musepack-tools: for mpc support'
            'vorbis-tools: for ogg support'
            'opus-tools: for opus support')
makedepends=('pkgconfig')
source=($pkgname-$pkgver.tar.gz::https://github.com/gogglesmm/audioconvert/archive/$pkgver.tar.gz)
md5sums=('380dd602fc1abdc83ae209439368b348')


build() {
  cd audioconvert-$pkgver
  ./configure --prefix=/usr
  make
}


package() {
  cd audioconvert-$pkgver
  make DESTDIR="$pkgdir" install
}
