# Maintainer: Pablo Hardouin <contact at pablo dot town>
_pkgname=libcini
pkgname="${_pkgname}-git"
pkgver=2.1.1
pkgrel=1
pkgdesc="A simple and easy-to-use C initiation library"
arch=("x86_64")
url="https://github.com/wegank/libcini"
license=('GPL')
groups=()
depends=('sdl2-compat' 'sdl2_ttf')
makedepends=('git' 'cmake')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${_pkgname}::git+https://github.com/wegank/libcini.git")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  mkdir build
  cd build
  cmake ..
  cpack ..
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 -t "${pkgdir}/usr/include/" include/*
  install -Dm755 build/src/libcini.so "${pkgdir}/usr/lib/libcini.so"
}
