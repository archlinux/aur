# Maintainer: TheGoliath
#
pkgname=sgminer
pkgver=5.1.1
pkgrel=3
pkgdesc="A multi-threaded multi-pool GPU miner for scrypt-based coins."
arch=('i686' 'x86_64')
url="https://github.com/sgminer-dev/sgminer"
license=('GPL3')
depends=('curl' 'libcl' 'libtool' 'pkg-config')
makedepends=('opencl-headers')
optdepends=('ncurses: For ncurses formatted screen output'
            'opencl-nvidia: OpenCL implementation for NVIDIA'
            'opencl-catalyst: OpenCL implementation for AMD')
provides=('sgminer')
source=(https://github.com/sgminer-dev/sgminer/archive/${pkgver}.tar.gz)
md5sums=('43ff41d5443ee0591d8f59e49c6621e2')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir"
    msg2 "You should consider using something different than this miner. It wasn't updated since 2015!"
    make DESTDIR="$pkgdir" install 
}
