# Maintainer: Joseph Diza <josephm.diza@gmail.com>
pkgname=logc-git
pkgver=1.f9ea349
pkgrel=1
arch=('any')
pkgdesc='A simple logging library implemented in C99' 
url='https://github.com/rxi/log.c'
license=('GPL')
depends=()
optdepends=()
makedepends=('git' 'make')
source=("pkgname::git+https://github.com/rxi/log.c#branch=master")
provides=(logc)
conflicts=(logc)
sha512sums=("SKIP")

build() {
  cd "pkgname"
  cd src
  relflags="-O3 -DNDEBUG"
  gcc -c $relflags -fPIC -o logc.o log.c 
  gcc -shared -o logc.so logc.o
}

package() {
  cd "pkgname"
  cd src
  install logc.so "$pkgdir"
  install log.h "$pkgdir"
}
