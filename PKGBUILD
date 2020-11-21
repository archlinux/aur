# Maintainer: Ignacy Kuchcinski <ignacykuchcinski@gmail.com>
pkgname=cxxmatrix-git
pkgver=r56.69a73ed
pkgrel=1
pkgdesc="A C++ based scrolling Matrix digital rain along with other scenes."
arch=('x86_64')
url="https://github.com/akinomyoga/cxxmatrix"
license=('MIT')
conflicts=('cxxmatrix')
provides=('cxxmatrix')
depends=('gawk')
makedepends=('git')
source=("git+https://github.com/akinomyoga/cxxmatrix")
md5sums=('SKIP') #autofill using updpkgsums

pkgver() {
  cd "$srcdir/cxxmatrix"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "cxxmatrix"
  make  
}

package() {
  cd "cxxmatrix"
  make PREFIX="$pkgdir/usr/" install
}
