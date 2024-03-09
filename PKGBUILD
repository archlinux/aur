# Maintainer: Mykola Dimura <mykola.dimura@gmail.com>
pkgname=readerwriterqueue-git
pkgver=1.0.6.r5.g2dee33a
pkgrel=1
pkgdesc="A fast single-producer, single-consumer lock-free queue for C++."
arch=('any')
url='https://github.com/cameron314/readerwriterqueue'
license=('BSD-2-Clause')
depends=()
makedepends=('git')
provides=(readerwriterqueue)
conflicts=(readerwriterqueue)
options=('!strip' '!buildflags' 'staticlibs')
source=("${pkgname}::git+https://github.com/cameron314/readerwriterqueue.git#branch=master")
sha1sums=('SKIP')

build() {
    echo "done"
}

package() {
    cd "${pkgname}"
    install -D -m644 readerwriterqueue.h atomicops.h -t "${pkgdir}/usr/include/readerwriterqueue"
    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
 
pkgver() {
  git -C ${pkgname} describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}
