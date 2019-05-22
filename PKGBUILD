# Maintainer: Daniel "dtubber" Wanner <daniel.wanner@tubber.xyz>

pkgname="ryzenadj-git"
pkgver=gui.v0.2.1.r2.g4656930
pkgrel=4
pkgdesc="RyzenAdj tool for adjusting Ryzen Mobile power states"
url="https://github.com/FlyGoat/RyzenAdj"
arch=("x86_64")
depends=("pciutils")
makedepends=("cmake")
license=("LGPL2")
source=("$pkgname::git+https://github.com/FlyGoat/RyzenAdj")
md5sums=("SKIP")

pkgver() {
    cd $pkgname
    git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'    
}

build() {
    cd $pkgname
    mkdir build || true
    cd build
    cmake ..
    make || true
}

package() {
    mkdir -p $pkgdir/usr/bin || true
    cd $pkgname
    pwd
    ls -la
    cp ryzenadj $pkgdir/usr/bin/
}
