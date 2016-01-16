# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=d2vwitch-git
pkgver=v1.0.gb9b26a9
pkgrel=1
pkgdesc="Cross-platform D2V creator. (GIT version)"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=173090'
license=('GPL')
depends=('ffmpeg')
makedepends=('git')
provides=('d2vwitch')
conflicts=('d2vwitch')
source=('d2vwitch::git+https://github.com/dubhater/D2VWitch.git')
sha1sums=('SKIP')

pkgver() {
  cd d2vwitch
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd d2vwitch
  ./autogen.sh
}

build() {
  cd d2vwitch
  ./configure --prefix=/usr
  make
}

package() {
  make -C d2vwitch DESTDIR="${pkgdir}" install
}
