# Maintainer: Grega Vrbančič <grega.vrbancic@gmail.com>

pkgname=nordugrid-arc
pkgver=6.7.0
pkgrel=1
pkgdesc="The Advanced Resource Connector (ARC) middleware, developed by the NorduGrid Collaboration."
arch=('x86_64')
url="http://www.nordugrid.org/arc/arc6"
license=('Apache 2.0')
depends=('python2' 'globus-toolkit')
makedepends=()
provides=()
source=(http://download.nordugrid.org/packages/$pkgname/releases/$pkgver/src/$pkgname-$pkgver.tar.gz{,.asc})
sha256sums=('156265ff7dcebe94e61e850ce11584ad70ee25f885bba9277810d8ed2e1ab408'
            'SKIP')
validpgpkeys=('2BD6CDCE625B9FD35F25621DE8C1DBE17CE871D5')

build() {
    cd "$pkgname-$pkgver"
    ./configure --disable-swig --with-python=python2
    make
}

package() {
        cd "$pkgname-$pkgver"
        make DESTDIR="$pkgdir" install
}
