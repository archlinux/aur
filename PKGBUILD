# Maintainer: Jordi Pakey-Rodriguez <jordi at 0xdec dot im>

pkgname=kicad-templates
pkgver=5.1.5
pkgrel=1
pkgdesc="KiCad templates"
arch=('any')
url="https://github.com/KiCad/kicad-templates"
license=('GPL')
groups=('kicad-libraries')
makedepends=('cmake')
options=('!strip')
conflicts=('kicad-templates-git' 'kicad-library-git' 'kicad-library' 'kicad-library-3d')
source=("https://github.com/KiCad/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('f08f857eee9b88cc89d1579c66046e01d752cf696d468d8ac2465066d379e406')

build() {
  cd "$srcdir"
  mkdir -p "$srcdir/build/"
  cd "$srcdir/build"
  cmake ../${pkgname}-${pkgver} -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
}
