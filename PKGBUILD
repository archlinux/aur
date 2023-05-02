# Maintainer: Andrius Pukšta <andrius.puksta at gmail dot com>
# Contributor: Mike Sampson <mike at sambodata dot com>
# Contributor: Adam Strauch <creckx at gmail dot com>
# Contributer: L42y <423300 at gmail dot com>

pkgname=daemon
pkgver=0.8.2
pkgrel=2
pkgdesc="Run any program as daemon"
arch=('i686' 'x86_64')
url="https://www.libslack.org/daemon/"
license=('GPL')
provides=('daemon')
depends=('glibc')
makedepnds=('perl' 'make' 'gcc')
source=("https://libslack.org/daemon/download/$pkgname-$pkgver.tar.gz")
sha256sums=('b34b37543bba43bd086e59f4b754c8102380ae5c1728b987c890d5da4b4cf3ca')

build() {
    cd $srcdir/$pkgname-$pkgver
    ./configure --prefix=/usr --destdir="$pkgdir/"
    CFLAGS='-march=native ' make
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make install
}
