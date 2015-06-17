# Maintainer: M0Rf30

pkgname=fwts-git
pkgver=2325.c519fe0
pkgrel=1
pkgdesc="The FirmWare Test Suite is a tool to do automatic testing of a PC's firmware"
arch=('i686' 'x86_64')
url="http://smackerelofopinion.blogspot.com/2010/08/firmware-test-suite-biosacpi-health.html"
license=('GPL')
depends=('pcre' 'json-c')
makedepends=('git')
source=('fwts::git://kernel.ubuntu.com/hwe/fwts.git')

build() {
  cd fwts
  autoreconf -ivf
  ./configure --prefix=/usr 
  make
}

package() {
  cd fwts
  make DESTDIR=$pkgdir install
}

pkgver() {
  cd fwts
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
