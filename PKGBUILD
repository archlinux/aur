pkgname=dvorak7min
pkgver=1.6.1
pkgrel=5
pkgdesc="dvorak7min is a simple ncurses-based typing tutor for those trying to become fluent with the Dvorak keyboard layout"
arch=('i686' 'x86_64')
license=('GPL')
url="http://packages.debian.org/unstable/games/dvorak7min"
depends=('ncurses')
source=(http://http.debian.net/debian/pool/main/d/dvorak7min/dvorak7min_1.6.1+repack.orig.tar.gz)
md5sums=('e2c3e02b4f0cf24fcf29118d01f52956')


build() {
    cp $startdir/0001-sys_errlist-to-strerror.patch $pkgname-$pkgver
    cd $pkgname-$pkgver
    patch -p1 < 0001-sys_errlist-to-strerror.patch
    make INSTALL="$pkgdir/usr/bin"
}

package() {
    cd $pkgname-$pkgver
    make INSTALL="$pkgdir/usr/bin" install
}