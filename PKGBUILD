# Maintainer: Yuval Adam <yuval at y3xz dot com> PGP-Key: 271386AA2EB7672F

pkgname=firestr-git
pkgver=7f47d2b
pkgrel=1
pkgdesc="The grass computing platform"
arch=('any')
url="https://github.com/mempko/firestr"
license=(GPL)
makedepends=('gcc' 'qt5-base' 'qt5-multimedia' 'boost' 'botan-1.10' 'opus' 'snappy' 'openssl' 'gmp')
provides=('firestr')
source=("$pkgname::git+$url") 
sha1sums=('SKIP')

pkgver() {
  cd "$pkgname"
  echo $(git describe --always | sed 's/-/./g')
}

build() {
  cd "$pkgname"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "$pkgname"
  cd build
  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
