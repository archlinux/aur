# Maintainer: Michael Duell <mail at akurei dot me>
pkgname=encpipe-git
_pkgnamenogit=encpipe
pkgver=0.4.r4.gc8cd6a1
pkgrel=2
pkgdesc="Encrypt data from stdin to stdout with libhydrogen."
url="https://github.com/jedisct1/encpipe"
arch=('x86_64' 'i686')
license=('ISC')
makedepends=('git')
source=("git+https://github.com/jedisct1/encpipe.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgnamenogit}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgnamenogit}"
  make
}

package() {
  cd "${srcdir}/${_pkgnamenogit}"
  make DESTDIR="${pkgdir}" PREFIX="${pkgdir}/usr" install
}


