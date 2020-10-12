# Maintainer: Přemysl Eric Janouch <p@janouch.name>
pkgname=sensei-raw-ctl
pkgver=r47.be98666
pkgrel=1
pkgdesc="SteelSeries Sensei Raw configuration tool"
arch=('i686' 'x86_64')
url="https://git.janouch.name/p/sensei-raw-ctl"
makedepends=('git' 'make' 'cmake' 'help2man')
provides=('sensei-raw-ctl')
source=('git+https://git.janouch.name/p/sensei-raw-ctl.git#commit=be98666')
md5sums=('SKIP')
license=('custom:0BSD')

build() {
  cd "$srcdir/$pkgname"
  cmake . -DCMAKE_INSTALL_PREFIX=$pkgdir/usr -DBUILD_GUI=NO
}

package() {
  cd "$srcdir/$pkgname"
  make install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
