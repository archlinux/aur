# Maintainer: Julio Diez <juliosddr@gmail.com>
_pkgname=suscan
pkgname="${_pkgname}-git"
pkgver=0.1
pkgrel=1
pkgdesc="SUScan is a graphical signal analysis tool"
arch=("any")
url="https://github.com/BatchDrake/suscan"
license=("GPL")
depends=("soapysdr" "sigutils-git" "git")
provides=("suscan")
conflicts=("suscan")
source=(suscan::git+https://github.com/BatchDrake/suscan.git)
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
