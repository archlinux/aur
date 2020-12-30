# Maintainer: Jordi Pakey-Rodriguez <jordi at 0xdec dot im>
# Contributor: Grey Christoforo <first name at last name dot net>

pkgname=kicad-packages3d
_pkgname=kicad-packages3D
pkgver=5.1.9
pkgrel=1
pkgdesc="KiCad 3D package libraries"
arch=('any')
url="https://gitlab.com/kicad/libraries/kicad-packages3D"
license=('GPL')
groups=('kicad-libraries')
makedepends=('cmake')
options=('!strip')
conflicts=('kicad-packages3d-git' 'kicad-library-git' 'kicad-library' 'kicad-library-3d')
source=("https://gitlab.com/kicad/libraries/$_pkgname/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('efce7b0b65ece76b57002cd4b84152fb359f7c47fe0b3d71166e9255ffa5c5b0')

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
