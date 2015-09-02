# Maintainer: Anthony Vitacco <anthony@littlegno.me>
# Contributor: Unia <hjdskes@gmail.com> 

pkgname=gcolor3
pkgver=1.2.1
pkgrel=1
pkgdesc="A simple color selection dialog in GTK3"
arch=('i686' 'x86_64')
url="http://unia.github.io/gcolor3/"
license=('GPL2')
depends=('gtk3' 'hicolor-icon-theme')
makedepends=('intltool')
conflicts=('gcolor3-git')
source=(https://github.com/Unia/gcolor3/archive/v1.2.1.tar.gz)
install=gcolor3.install
md5sums=('d3b9d037d994f4efd36e58d3b81aa96d')

build() {
    cd "$srcdir"/$pkgname-$pkgver
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

