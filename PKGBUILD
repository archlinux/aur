# Maintainer: Dario Spinnato <dario.spinnato07@gmail.com>
pkgname=snes-asar-thedopefish-git
pkgbase=snes-asar-thedopefish-git
provides=('snes-asar')
conflicts=('snes-asar')
pkgver=1.90pre
pkgrel=1
pkgdesc="SNES assembler for applying patches to existing ROMs or creating new ROMs from scratch, thedopefish branch"
arch=('i686' 'x86_64')
url='https://github.com/thedopefish/asar'
license=('LGPL3')
makedepends=('cmake' 'git')
source=("git+https://github.com/thedopefish/asar.git")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/asar/"
    cmake src
    make
}

package() {
    cd "${srcdir}/asar/"
    install -Dm755 "${srcdir}/asar/asar/bin/asar" "$pkgdir/usr/bin/asar"
}
