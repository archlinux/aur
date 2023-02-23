pkgname=mingw-w64-exprtk
pkgver=0.0.2
pkgrel=1
pkgdesc="C++ Mathematical Expression Library (mingw-w64)"
arch=('any')
url="http://www.partow.net/programming/exprtk/index.html"
license=('CPL')
depends=('mingw-w64-crt')
source=("https://github.com/ArashPartow/exprtk/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7e8de4a0bfc9855c1316d8b8bc422061aef9a307c2f42d2e66298980463195c1')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

package() {
  cd "$srcdir/exprtk-${pkgver}"
  for _arch in ${_architectures}; do
    install -d "${pkgdir}"/usr/${_arch}/include
    install -D -m644 exprtk.hpp "${pkgdir}"/usr/${_arch}/include
  done
}
