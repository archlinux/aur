# Maintainer:  <oslik@dragon>
pkgname=xdxf_makedict-git
_srcname=xdxf_makedict
pkgver=0.3.1beta1
pkgrel=1
epoch=
pkgdesc="XDXF dictionary format and \"makedict\" dictionary converting software"
arch=('i686' 'x86_64')
url="https://github.com/soshial/xdxf_makedict/"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git://github.com/soshial/$_srcname.git"
        "$_srcname.patch")
noextract=()
md5sums=('SKIP' "4999f8084679d8a5fcb95a60439ebe9e")

prepare() {
  cd "$srcdir/$_srcname/src"
  patch -i "$srcdir/$_srcname.patch"
}

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr "../$_srcname"
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
