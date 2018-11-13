# Maintainer: Mykola Dimura <mykola.dimura@gmail.com>
pkgname=readerwriterqueue-git
pkgver=r102.d0f9f0c
pkgrel=1
pkgdesc="A fast single-producer, single-consumer lock-free queue for C++."
arch=('any')
url='https://github.com/cameron314/readerwriterqueue'
license=('Simplified BSD License')
depends=()
makedepends=('git')
options=('!strip' '!buildflags' 'staticlibs')
source=("${pkgname}::git+https://github.com/cameron314/readerwriterqueue.git#branch=master")
sha1sums=('SKIP')

build() {
    echo "done"
}

package() {
    cd "${srcdir}/${pkgname}"
    INCDIR="${pkgdir}/usr/include/readerwriterqueue"
    mkdir -p "${INCDIR}"
    cp readerwriterqueue.h atomicops.h "${INCDIR}/"
}
 
pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
