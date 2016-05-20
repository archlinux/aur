# Maintainer: zlsun <zlsun1995 at gmail dot com>
# Contributor: yetist <yetist@gmail.com>

pkgname=lunar-calendar2
_pkgname=lunar-calendar
pkgver=2.4.1
pkgrel=1
pkgdesc="Chinese Lunar calendar widget for Gtk+"
arch=("i686" "x86_64")
url="http://code.google.com/p/liblunar/"
license=('GPL2')
depends=('gtk2>=2.22' 'lunar-date>=2.4.0')
source=("http://liblunar.googlecode.com/files/$_pkgname-$pkgver.tar.gz")
sha256sums=('8bed2f3f385b2e9103331e2f536dfb488d8576550b62788ff8dfcee6d19f5ce3')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    ./configure --prefix=/usr
    make || return 1
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install || return 1
}
