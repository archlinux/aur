pkgname=snes-asar
pkgver=1.81
pkgrel=1
pkgdesc="SNES assembler for applying patches to existing ROMs or creating new ROMs from scratch"
arch=('i686' 'x86_64')
url='https://github.com/RPGHacker/asar'
license=('LGPL3')
makedepends=('cmake')
source=("https://github.com/RPGHacker/asar/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('b5069c631e6494172b1f9e559252d863')

build() {
    cd "${srcdir}/asar-${pkgver}"
    cmake src
    make
}

package() {
    cd "${srcdir}/asar-${pkgver}"
    install -Dm755 "${srcdir}/asar-${pkgver}/asar/asar-standalone" "$pkgdir/usr/bin/asar"
}
