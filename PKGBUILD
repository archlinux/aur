#Maintainer: M0Rf30

pkgname=openicc
pkgver=1.3.1
pkgrel=1
pkgdesc="Colour management projects to share ICC related implementation details"
url="http://www.freedesktop.org/wiki/OpenIcc"
arch=('i686' 'x86_64')   
depends=('xorg-server')
source=("http://downloads.sourceforge.net/project/openicc/OpenICC-Profiles/icc-profiles-$pkgname-$pkgver.tar.bz2")
license=('GPL')

build() {
    cd $srcdir/icc-profiles-$pkgname-$pkgver
    ./configure --prefix=/usr
    make
}
package() {
    cd $srcdir/icc-profiles-$pkgname-$pkgver
    make DESTDIR=$pkgdir install
}

md5sums=('d18ed8dc5e3f6792d445af67d5f3b0d6')
