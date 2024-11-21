pkgname=fast-cpp-csv-parser-git
pkgver=r70.758f566
pkgrel=1
pkgdesc="Fast C++ CSV Parser"
arch=('any')
url="https://github.com/ben-strasser/fast-cpp-csv-parser"
license=('BSD')
makedepends=('git')
source=("git+https://github.com/ben-strasser/fast-cpp-csv-parser.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/fast-cpp-csv-parser"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/fast-cpp-csv-parser"
  install -d "${pkgdir}"/usr/include
  install -D -m644 csv.h "${pkgdir}"/usr/include
}
