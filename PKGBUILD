# Maintainer: Anthony Vitacco <anthony@littlegno.me>
# Contributor: Jente Hidskes <hjdskes@gmail.com> 

pkgname=gcolor3
pkgver=2.0
pkgrel=1
pkgdesc="A simple color selection dialog in GTK3"
arch=('i686' 'x86_64')
url="http://unia.github.io/gcolor3/"
license=('GPL2')
depends=('gtk3' 'hicolor-icon-theme')
makedepends=('intltool')
conflicts=('gcolor3-git')
source=(https://github.com/Unia/gcolor3/archive/v2.0.tar.gz)
install=gcolor3.install
sha256sums=("d3a072e521d234ba49088355a7cbd069c7e0bb876cb06d78491307aadf603c12")

build() {
    cd "$srcdir"/$pkgname-$pkgver
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

