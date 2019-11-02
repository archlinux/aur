# Maintainer: Cédric FARINAZZO, <cedric.farinazzo@gmail.com>

pkgname=gns3-ubridge
pkgver=0.9.16
pkgrel=2
pkgdesc='Bridge for UDP tunnels, Ethernet, TAP and VMnet interfaces. GNS3 Tool'
arch=('i686' 'x86_64')
url='https://github.com/GNS3/ubridge'
license=('GPL3')
groups=('gns3')
makedepends=('make')
depends=('libpcap')
optdepends=()
source=("https://github.com/GNS3/ubridge/archive/v${pkgver}.tar.gz")
md5sums=('SKIP')

build() {
    cd ${srcdir}/ubridge-${pkgver}
    make
}

package() {
    cd ${srcdir}/ubridge-${pkgver}
    mkdir -p $pkgdir/usr/local/bin
    make BINDIR=$pkgdir/usr/local/bin install
}
