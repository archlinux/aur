# Contributor: skualito <lepascalou at GMAIL dot COM> 

pkgname=termrec
pkgver=0.17
pkgrel=1
pkgdesc="A set of tools for recording/replaying text-terminal session, in the vein of ttyrec."
arch=('any')
url="http://angband.pl/termrec.html"
license=('GPL')
optdepends=('zlib' 'bzip2')
source=(http://downloads.sourceforge.net/project/termrec/termrec/$pkgver/$pkgname-$pkgver.tar.xz)
md5sums=('4d0bc41411196a81157a72b68736a0f4')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr
    make 
    }

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    }
