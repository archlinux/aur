# Maintainer: Jordi Pakey-Rodriguez <jordi at 0xdec dot im>

pkgname=kicad-templates
pkgver=5.1.9
pkgrel=1
pkgdesc="KiCad templates"
arch=('any')
url="https://gitlab.com/kicad/libraries/kicad-templates"
license=('GPL')
groups=('kicad-libraries')
makedepends=('cmake')
options=('!strip')
conflicts=('kicad-templates-git')
source=("https://gitlab.com/kicad/libraries/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('0c1bf3d2e6d8d1056a5da6c1f7a173551c154b4bdaddb86b6a34155b18e65da6')

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
