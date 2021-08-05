# Maintainer: Pascal Bos <bosp@nikhef.nl>
# Contributor: Felix Salfelder <felix@salfelder.org>

pkgname=qucsator-git
pkgver=0.0.20
pkgrel=1
pkgdesc="An integrated circuit simulator"
arch=('x86_64')
url="http://qucs.sourceforge.net"
license=('GPL')
depends=('gcc-libs' 'adms')
makedepends=('git' 'gperf')
source=('git+https://github.com/Qucs/qucsator.git#branch=develop')
md5sums=('SKIP')

build() {
    cd ./qucsator
    ./bootstrap
    ./configure --prefix=/usr
    make -j1
}

package() {
    cd ./qucsator
    make DESTDIR="$pkgdir" install
}

 
