# Maintainer: Jordi Pakey-Rodriguez <jordi@0xdec.im>

pkgname=kicad-templates
pkgver=5.1.0
pkgrel=1
pkgdesc="KiCad templates"
arch=('any')
url="https://github.com/KiCad/kicad-templates"
license=('GPL')
makedepends=('cmake')
options=('!strip')
conflicts=('kicad-templates-git' 'kicad-library-git' 'kicad-library' 'kicad-library-3d')
source=("https://github.com/KiCad/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('36c4ac1ea78333cd92dc82b28f57066a9888801dc7d803d822e22b5b2a924516')

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
