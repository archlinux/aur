# Maintainer: Andrius Pukšta <andrius.puksta at gmail dot com>
# Contributor: Mike Sampson <mike at sambodata dot com>
# Contributor: Adam Strauch <creckx at gmail dot com>
# Contributer: L42y <423300 at gmail dot com>

pkgname=daemon
pkgver=0.8.4
pkgrel=1
pkgdesc="Run any program as a daemon"
arch=('i686' 'x86_64')
url="https://www.libslack.org/daemon/"
license=('GPL-2.0-only')
provides=('daemon')
depends=('glibc' 'systemd-libs')
makedepends=('perl' 'make' 'gcc')
source=("https://libslack.org/daemon/download/$pkgname-$pkgver.tar.gz")
sha256sums=('fa28859ad341cb0a0b012c11c271814f870482013b49f710600321d379887cd1')

build() {
    cd $srcdir/$pkgname-$pkgver
    ./configure --prefix=/usr --destdir="$pkgdir/" --enable-logind
    CFLAGS='-march=native ' make
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make install
}
