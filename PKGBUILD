# Maintainer: Jordi Pakey-Rodriguez <jordi at 0xdec dot im>

pkgname=kicad-templates
pkgver=5.1.7
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
sha256sums=('0454a08872e39c7f5f038f4447606ec05d7e327684a8361ccb71e7e3d497bbb2')

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
