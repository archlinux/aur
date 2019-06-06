# Contributor: skualito <lepascalou at GMAIL dot COM> 

pkgname=termrec
pkgver=0.18
pkgrel=1
pkgdesc="A set of tools for recording/replaying text-terminal session, in the vein of ttyrec."
arch=('x86_64')
url="http://angband.pl/termrec.html"
license=('LGPL2.1')
optdepends=('zlib' 'bzip2' 'curl' 'zstd')
source=("http://downloads.sourceforge.net/project/termrec/termrec/$pkgver/$pkgname-$pkgver.tar.xz")
md5sums=('73b48881e1493be78cd20cda97f870e0')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr
    make 
    }

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    }
