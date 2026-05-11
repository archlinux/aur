# Maintainer: René Wagner <rwa AT clttr DOT info>
# Contributor: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lcms2-ff
pkgver=2.19.1
pkgrel=1
pkgdesc="Small-footprint color management engine including fast_float plugin"
arch=('x86_64')
url="https://www.littlecms.com/"
license=('MIT')
depends=('glibc' 'libtiff')
makedepends=('git')
provides=('lcms2' 'liblcms2.so')
conflicts=('lcms2')
options=('staticlibs')
source=("https://github.com/mm2/Little-CMS/releases/download/lcms${pkgver}/lcms2-${pkgver}.tar.gz")

build() {
  cd "lcms2-${pkgver}"

  ./autogen.sh
  ./configure --prefix="/usr" --with-fastfloat
  make
}

check() {
  cd "lcms2-${pkgver}"

  make check
}

package() {
  cd "lcms2-${pkgver}"

  make DESTDIR="$pkgdir" install
}
sha256sums=('bfc54f7bab59fbc921012014a8032e4cba4abd46db47d46b76416a8c0b2815c8')
