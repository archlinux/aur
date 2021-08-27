# Maintainer: EndlessEden <eden [at] rose.place>
# Upstream Maintainer: Filipe Laíns (FFY00) <filipe.lains@gmail.com>

pkgname="eti-tools-git"
_pkgname="eti-tools"
pkgver=0.01.c19e215
pkgrel=1
pkgdesc='ETI(Ensemble Transport Interface) conversion software suite.'
arch=('x86_64')
url="https://github.com/piratfm/$_pkgname"
license=("$srcdir/$pkgname/LICENSE")
depends=('rtl-sdr' 'fftw' 'libfec' 'libshout' 'zeromq')
makedepends=('git' 'cmake')
provides=("$_pkgname" "$pkgname" "bbfedi2eti" "dvb-ip-mpe2ts" "edi2eti" "eti2zmq" "fedi2eti" "mpe2aac" "mpe2mpa" "mpe2ts" "na2ni" "na2ts" "ni2out" "ts2na")
conflicts=("$_pkgname" "bbfedi2eti" "dvb-ip-mpe2ts" "edi2eti" "eti2zmq" "fedi2eti" "mpe2aac" "mpe2mpa" "mpe2ts" "na2ni" "na2ts" "ni2out" "ts2na")
source=("$_pkgname::git+$url.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir"/"$_pkgname"/
  echo $(echo 0.01).$(git rev-parse --short HEAD)
}


build() {
  cd "$srcdir"/"$_pkgname"/

  DESTDIR="/usr" make
}

package() {
  cd "$srcdir"/"$_pkgname"/

  make DESTDIR="$pkgdir" install
}

