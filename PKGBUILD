# Maintainer: Kaan Genç <aur@kaangenc.me>
# Contributor: William J. Bowman <aur@williamjbowman.com>
# Contributor: Vasco Costa <vasco dot costa at geekslot dot com>
pkgname=libhoard-git
pkgver=r504.9d137ef
pkgrel=1
pkgdesc="The Hoard Memory Allocator: A Fast, Scalable, and Memory-efficient Malloc for Linux, Windows, and Mac. http://www.hoard.org"
arch=('i686' 'x86_64')
url="http://www.hoard.org/"
license=('GPL')
depends=('gcc')
conflicts=('hoard')
provides=('libhoard')
install=$pkgname.install
source=("${pkgname}::git+https://github.com/emeryberger/Hoard.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}/src"
  make
}

package(){
  cd "${srcdir}/${pkgname}/src"
  install -D -m755 libhoard.so ${pkgdir}/usr/lib/libhoard.so
}
