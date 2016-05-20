# Maintainer: zlsun <zlsun1995 at gmail dot com>
# Contributor: yetist <yetist@gmail.com>

pkgname=lunar-calendar
pkgver=3.0.0
pkgrel=1
pkgdesc="Chinese Lunar calendar widget for Gtk+"
arch=("i686" "x86_64")
url="http://code.google.com/p/liblunar/"
license=('GPL2')
depends=('gtk3>=3.0.9' 'lunar-date>=2.4.0')
source=("http://liblunar.googlecode.com/files/$pkgname-$pkgver.tar.gz")
sha256sums=('8cdbf367250e48774f79a10897126e0e92171b49167959b72554e583999a3294')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr
    make || return 1
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install || return 1
}
