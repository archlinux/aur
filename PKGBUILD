# Maintainer: Pan Lanlan <abbypan@gmail.com>
pkgname=herumi-bls-git
pkgver=0.0.1
pkgrel=1
pkgdesc='BLS threshold signature'
arch=('any')
license=('BSD')
makedepends=(python git)
url="https://github.com/herumi/bls"

build() {
    git clone --recursive https://github.com/herumi/bls
    cd bls
    make
}

package() {
	cd bls
    make install DESTDIR=$pkgdir
    cp mcl/lib/* $pkgdir/usr/local/lib/
}
