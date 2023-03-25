
# Maintainer: Alfred Roos alfred@stensatter.se
pkgname=weber-git
pkgver=1.0.5
pkgrel=1
epoch=
pkgdesc="compiles html components to pages"
arch=(x86_64)
url="https://github.com/SharkooMaster/weber.git"
license=('GPL-2.0')
groups=()
depends=(python)
makedepends=(python-pip)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=()
validpgpkeys=()

prepare() {
    pip install flagser
    git clone https://github.com/SharkooMaster/weber.git
}

package() {
    cd weber
    sed -i -e '1i#!/bin/python\' ./compile.py
    install -Dm755 ./compile.py "$pkgdir/usr/bin/weber" 
    install -Dm755 ./watcher.py "$pkgdir/usr/bin/watcher.py" 
    install -Dm755 ./generateFiles.py "$pkgdir/usr/bin/generateFiles.py" 
}
