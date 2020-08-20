# Maintainer: blacktea <blackteahamburger@outlook.com>

pkgname='colorthis-git'
pkgver=r10.a3f47ea
pkgrel=1
pkgdesc="Make your pipe and logfile colorful"
arch=('x86_64')
url='https://github.com/Sasasu/ColorThis'
license=('MIT')
makedepends=('cmake' 'git')
provides=('colorthis')
conflicts=('colorthis')
source=('colorthis-git::git+https://github.com/Sasasu/ColorThis.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
}
