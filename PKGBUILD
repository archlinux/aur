# Maintainer: Julio Diez <juliosddr@gmail.com>
_pkgname=sigutils
pkgname="${_pkgname}-git"
pkgver=0.1
pkgrel=1
pkgdesc="Digital signal processing library"
arch=("any")
url="https://github.com/BatchDrake/sigutils"
license=("GPL")
depends=("libsndfile" "git")
provides=("sigutils")
conflicts=("sigutils")
source=(sigutils::git+https://github.com/BatchDrake/sigutils.git)
md5sums=("SKIP")

build() {
  cd "$_pkgname"
  
  autoreconf -fvi

  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir/" install
}
