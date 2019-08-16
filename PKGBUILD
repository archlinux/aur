# Maintainer: Jordi Pakey-Rodriguez <jordi at 0xdec dot im>

pkgname=kicad-templates
pkgver=5.1.4
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
sha256sums=('be2fc20ccf646843af4871ad2d4cd79418e895bc70442569f0b1f423c615bdbb')

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
