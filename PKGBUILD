pkgname=exprtk-git
pkgver=r170.b8e8b95
pkgrel=1
pkgdesc="C++ Mathematical Expression Library"
arch=('any')
url="http://www.partow.net/programming/exprtk/index.html"
license=('CPL')
depends=()
makedepends=('git')
provides=('exprtk')
conflicts=('exprtk')
source=('git+https://github.com/ArashPartow/exprtk.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/exprtk"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/exprtk"
  install -d "${pkgdir}"/usr/include
  install -D -m644 exprtk.hpp "${pkgdir}"/usr/include
}
