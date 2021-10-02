# Maintainer: robertfoster

pkgname=termistor-git
pkgver=50.bc0843f
pkgrel=1
pkgdesc="A drop-down terminal for Wayland"
arch=('i686' 'x86_64')
url="https://github.com/giucam/termistor"
license=('GPL3')
depends=('wayland' 'libxkbcommon')
makedepends=('git')
provides=("${pkgname%%-git}")
conflicts=("${pkgname%%-git}")
source=("${pkgname%%-git}::git+${url}")

build() {
  cd "${srcdir}/${pkgname%%-git}"
  cmake .
  make
}

package(){
  cd "${srcdir}/${pkgname%%-git}"
  make DESTDIR=$pkgdir install
}

pkgver() {
  cd "${srcdir}/${pkgname%%-git}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
