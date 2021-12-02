# Maintainer: ohli <olifriedrich at gmail dot com>

pkgname=librepfunc
pkgver=1.1.1
provides=("librepfunc")
pkgrel=1
pkgdesc="a collection of common functions, classes and tools. Mainly used by w_scan_cpp"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/wirbel-at-vdr-portal/librepfunc"
license=('GPL2')
depends=('glibc')
makedepends=('make' 'wget' 'git' 'grep' 'sed')
source=("librepfunc::git+https://github.com/wirbel-at-vdr-portal/librepfunc")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    MAJOR=$(grep -Po "(?<=MAJOR = )\d+" Makefile)
    MINOR=$(grep -Po "(?<=MINOR = )\d+" Makefile)
    PATCH=$(grep -Po "(?<=PATCH = )\d+" Makefile)
    echo ${MAJOR}.${MINOR}.${PATCH}
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}
