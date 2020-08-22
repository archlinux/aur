# Maintainer: Dave Simons <pkgs@simonsd.org> 

pkgname=sensei-raw-ctl
pkgver=2f70930
pkgrel=3
pkgdesc="SteelSeries Sensei Raw configuration tool"
arch=('i686' 'x86_64')
url="https://git.janouch.name/p/sensei-raw-ctl"
makedepends=('git' 'make' 'cmake' 'help2man')
provides=('sensei-raw-ctl')
source=('git+https://git.janouch.name/p/sensei-raw-ctl.git#commit=2f70930')
md5sums=('SKIP')
license=('Custom')

build() {
  cd "$srcdir/$pkgname"
  rm .git* -rf
  cmake . -DCMAKE_INSTALL_PREFIX=$pkgdir/usr -DBUILD_GUI=NO
}

package() {
  cd "$srcdir/$pkgname"
  make install
}
