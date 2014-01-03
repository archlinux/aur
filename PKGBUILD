# Maintainer: Dave Simons <pkgs@simonsd.org> 

pkgname=sensei-raw-ctl-git
pkgver=1
pkgrel=1
pkgdesc="SteelSeries Sensei Raw configuration tool"
arch=('i686' 'x86_64')
url="https://github.com/pjanouch/sensei-raw-ctl"
makedepends=('git' 'make' 'cmake' 'help2man')
provides=('sensei-raw-ctl')
source=('git://github.com/pjanouch/sensei-raw-ctl.git')
md5sums=('SKIP')
license=('Custom')

pkgver() {
  cd "$srcdir/sensei-raw-ctl"
  git rev-parse --short HEAD
}

build() {
  cd "$srcdir/sensei-raw-ctl"
  rm .git* -rf
  cmake . -DCMAKE_INSTALL_PREFIX=$pkgdir/usr -DBUILD_GUI=NO
}

package() {
  cd "$srcdir/sensei-raw-ctl"
  make install
}
