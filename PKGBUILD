# Maintainer: DJ Griffin <thewisenoob@gmail.com>

pkgname=omp-git
pkgver=0.0.8
pkgrel=1
pkgdesc='GTK3 Music Player'
url='http://openmusicplayer.com/'
arch=(x86_64)
license=(GPL3)
depends=(gstreamer gtkmm3 libclastfm libconfig taglib)
makedepends=(git)
provides=('omp-git')
conflicts=('omp' 'omp-git')
source=("$pkgname::git+https://github.com/TheWiseNoob/OpenMusicPlayer.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  make
}

package() {
  cd "${pkgname}"
  make install DESTDIR=${pkgdir}
}
