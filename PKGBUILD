# Maintainer: Jordi Pakey-Rodriguea <jordi at 0xdec dot im>
# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=kicad-packages3d
_pkgname=kicad-packages3D
pkgver=5.1.0
pkgrel=1
pkgdesc="KiCad 3D package libraries"
arch=('any')
url="https://github.com/KiCad/kicad-packages3D"
license=('GPL')
makedepends=('cmake')
options=('!strip')
conflicts=('kicad-packages3d-git' 'kicad-library-git' 'kicad-library' 'kicad-library-3d')
source=("https://github.com/KiCad/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('5ea2a0eb8cbe73bf069c96b8c823ef2af4c430e87287c7052aa32f24a9d2c7e6')

build() {
  cd "$srcdir"
  mkdir -p "$srcdir/build/"
  cd "$srcdir/build"
  cmake ../${_pkgname}-${pkgver} -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
}
