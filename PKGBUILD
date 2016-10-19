# Contributor:	Thomas Mudrunka <harvie@@email..cz>
# Maintainer:	quomoow <quomoow@gmail.com>


pkgname=gretl
pkgver=2016c
pkgrel=1
pkgdesc='cross-platform software package for econometric analysis, written in the C'
arch=('i686' 'x86_64')
url="http://gretl.sourceforge.net/"
license=('GPL')
depends=('gtksourceview3' 'curl' 'lapack' 'mpfr' 'fftw')
optdepends=('MPFR: additional multiple-precision functionality' 
	'readline: provides a nice editable command line in gretlcli' 
	'JSON-GLib: provides for parsing of data from various websites')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz")
md5sums=('61a76e8006989d91657c1ae68453a69a')

build() {
        cd "$srcdir/$pkgname-$pkgver"
        ./configure --prefix=/usr
        make
}

package() {
        cd "$srcdir/$pkgname-$pkgver"
        make DESTDIR="$pkgdir/" install
}

install() {
        cd "$srcdir/$pkgname-$pkgver"
        ./install --prefix=/usr
}


