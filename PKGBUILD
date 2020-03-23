# Maintainer: Ignacy Kuchcinski <ignacykuchcinski@gmail.com>
pkgname=cxxmatrix-git
pkgver=r51.1aa2cd8
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
  install -D "cxxmatrix" "$pkgdir/usr/bin/cxxmatrix"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/cxxmatrix/LICENSE.md"
}
