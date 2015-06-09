pkgname=gogglesmm-develop-git
pkgver=940
pkgrel=1
pkgdesc="Goggles Music Manager"
arch=('i686' 'x86_64' 'arm')
url="http://gogglesmm.github.io"
license=('GPL3')
install="$pkgname.install"
conflicts=('gogglesmm' 'gogglesmm-hg' 'gogglesmm-git')
depends=('fox-devel>=1.7.46' 'libogg' 'libvorbis' 'flac' 'libmad' 'faad2' 'expat' 'opus' 'dbus' 'taglib>=1.9.0' 'sqlite3' 'libgcrypt' 'libepoxy' 'glu' 'libsamplerate' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('git' 'cmake' 'pkgconfig' 'libpulse' 'alsa-lib' 'glproto' 'dri2proto' )
optdepends=('libpulse: PulseAudio Output' 'alsa-lib: Alsa Output')
md5sums=('SKIP')
source=("$pkgname"::'git://github.com/gogglesmm/gogglesmm.git#branch=develop')

pkgver() {
  cd "$pkgname"
  git rev-list --count HEAD
}

build() {
  cd "$pkgname"
  cmake .
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install

}
