# Maintainer: Jordi Pakey-Rodriguez <jordi at 0xdec dot im>

pkgname=kicad-templates
pkgver=5.1.8
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
sha256sums=('1afc8196f47d053937c2db9ee7f09b0d812e1ba93e57a0610ab1ced21c9134ca')

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
