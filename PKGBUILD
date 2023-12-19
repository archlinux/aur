# Maintainer: Sandro-Alessio Gierens <sandro@gierens.de>
pkgname=libctl2
pkgver=1.2
pkgrel=1
makedepends=('base-devel')
arch=('i686' 'x86_64')
pkgdesc="CTL is a Software Transactional Memory Framework based in TL2 including new features and optimizations."
url="https://docentes.fct.unl.pt/joao-lourenco/software/ctl-consistent-software-transactonal-layer"
license=('BSD-3-Clause')

build() {
    if [ ! -d ctl-1.2 ]; then
        rm -f ctl-1.2.tgz
        rm -rf ctl-1.2
        wget https://docentes.fct.unl.pt/joao-lourenco/files/ctl-1.2.tgz
        tar -xzf ctl-1.2.tgz
    fi
    cd ctl-1.2
    ./configure --prefix="$pkgdir/usr/local"
    make
}

package() {
    cd ctl-1.2
    make install
}
