# Maintainer: Raphael Nestler <raphael.nestler@gmail.com>

_gitname=sphero-linux-api
pkgname=libsphero-git
pkgver=1.0.r11.g6c6d6bd
pkgrel=1
pkgdesc='Simple API for sphero 1 and 2.0 written in C++'
arch=('i686' 'x86_64')
url="https://github.com/slock83/sphero-linux-api"
license=('GPL2')
depends=(bluez-libs)
makedepends=(git)
provides=('libsphero')
conflicts=('libsphero')
source=('git+https://github.com/rnestler/sphero-linux-api.git#branch=fix-missing-cstdint-include')
md5sums=(SKIP)

pkgver() {
  cd $_gitname
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//'
}

build() {
  cd $_gitname
  make
}

package() {
  cd $_gitname
  make DESTDIR=$pkgdir/usr install
}
