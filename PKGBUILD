# Maintainer: David Adler <d.adler@posteo.de>
# Contributor: Felix Salfelder <felix@salfelder.org>

pkgname=qucsator
pkgver=0.0.20
pkgrel=1
pkgdesc="An integrated circuit simulator"
arch=('x86_64')
url="http://qucs.sourceforge.net"
license=('GPL')
depends=('gcc-libs' 'adms')
makedepends=('git' 'gperf')
source=('git+https://github.com/Qucs/qucsator.git#tag=0.0.20')
md5sums=('SKIP')

build() {
    cd  $pkgname
    ./bootstrap
    ./configure --prefix=/usr
    make -j1
}

package() {
    cd $pkgname
    make DESTDIR="$pkgdir" install
}

