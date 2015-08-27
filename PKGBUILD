# Maintainer: Christian Babeux <christian.babeux@0x80.ca>

pkgname=lttngtop
pkgver=0.3
pkgrel=1
pkgdesc="A top-like, ncurses-based utility to analyze trace information produced by LTTng"
arch=('i686' 'x86_64')
url="http://lttng.org/"
license=('GPL2')
depends=('glib2>=2.22.0' 'ncurses' 'popt>=1.13' 'babeltrace')
source=(http://lttng.org/files/$pkgname/$pkgname-$pkgver.tar.bz2)
sha1sums=('d94a9877267350c5ab5eb2195a3061e04771e6bb')

build()
{
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package()
{
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
