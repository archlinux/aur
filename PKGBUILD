# Maintainer: Sander Jansen <s.jansen@gmail.com>
pkgname=gogglesmm-git
pkgver=592
pkgrel=1
pkgdesc="Goggles Music Manager"
arch=('i686' 'x86_64' 'arm')
url="http://gogglesmm.github.io"
license=('GPL3')
conflicts=('gogglesmm' 'gogglesmm-hg')
depends=('fox-devel>=1.7.46' 'libogg' 'libvorbis' 'flac' 'libmad' 'faad2' 'expat' 'opus' 'dbus-core' 'taglib>=1.9.0' 'sqlite3' 'libgcrypt' 'glew' 'glu')
makedepends=('git' 'pkgconfig' 'libpulse' 'alsa-lib' 'glproto' 'dri2proto' )
optdepends=('libpulse: PulseAudio Output' 'alsa-lib: Alsa Output')
md5sums=('SKIP')
source=("$pkgname"::'git://github.com/gogglesmm/gogglesmm.git')

pkgver() {
  cd "$pkgname"
  git rev-list --count HEAD
}

build() {
  cd "$pkgname"
  export RESWRAP=/usr/bin/reswrap-1.7
  ./configure
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}


# vim:set ts=2 sw=2 et:
