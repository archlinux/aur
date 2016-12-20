# Maintainer: zlsun <zlsun1995 at gmail dot com>
# Contributor: yetist <yetist@gmail.com>

pkgname=lunar-date
pkgver=2.4.2
pkgrel=1
pkgdesc="Chinese lunar date library."
arch=("i686" "x86_64")
url="http://code.google.com/p/liblunar/"
license=('GPL2')
depends=('glib2>=2.12')
makedepends=('intltool' 'gobject-introspection' 'gtk-doc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yetist/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('94622dfaddbf68722d772a85902e2518')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./autogen.sh
    ./configure --prefix=/usr
    make || return 1
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install || return 1
}

