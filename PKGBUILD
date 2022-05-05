# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=libelfin-git
pkgver=0.3.r6.g946dde5
pkgrel=1
pkgdesc="C++11 ELF/DWARF parser"
arch=(x86_64)
url="https://github.com/aclements/libelfin"
license=(MIT)
depends=(glibc)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/aclements/libelfin.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
  cd "${srcdir}/${pkgname}"

  make
}

package() {
  cd "${srcdir}/${pkgname}"

  make PREFIX="${pkgdir}/usr" install
}
