# Maintainer: Benedikt Bergenthal <b.bergenthal@cern.ch>
pkgname=benelib
pkgver=0.22.fad95b5
pkgrel=1
pkgdesc="A library containing many code snippets mostly for ROOT"
arch=('x86_64')
url="https://github.com/wutzi15/Benelib"
license=('GPL')
depends=('root')
makedepends=('git' 'root' 'cmake' 'boost' 'boost-libs')
provides=("${benelib}")
conflicts=("${benelib}")
source=("${pkgname%-git}::git+http://github.com/wutzi15/Benelib.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "0.%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"

  #./configure --prefix=/usr
  cmake .
  make
}

package() {
  cd "$pkgname"
  sudo make install
}