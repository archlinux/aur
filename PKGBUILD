# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=vorbis-tools-git
pkgver=r936.134b784
pkgrel=1
pkgdesc="Command-line tools for creating and playing Ogg Vorbis files"
arch=('i686' 'x86_64')
url="https://xiph.org/vorbis/"
license=('GPL')
depends=('curl' 'flac' 'libvorbis' 'speex')
makedepends=('git')
provides=('vorbis-tools')
conflicts=('vorbis-tools')
source=("git+https://git.xiph.org/vorbis-tools.git")
sha256sums=('SKIP')


pkgver() {
  cd "vorbis-tools"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "vorbis-tools"

  ./autogen.sh
  ./configure --prefix="/usr"
  make
}

package() {
  cd "vorbis-tools"

  make DESTDIR="$pkgdir" install
}
