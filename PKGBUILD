# Maintainer: goetzc
# Contributor: Frank Seifferth <frankseifferth@posteo.net>
pkgname=gcsvedit
pkgver=0.8.0
pkgrel=1
pkgdesc='Simple text editor for CSV, TSV and other kinds of delimiter-separated values (DSV) files.'
arch=('i686' 'x86_64')
url="https://github.com/swilmet/gCSVedit"
license=('GPL3')
depends=('gtk3' 'libxml2' 'gtksourceview3' 'tepl' 'gtksourceview4')
source=("https://github.com/swilmet/gCSVedit/releases/download/$pkgver/gcsvedit-$pkgver.tar.xz")
md5sums=('bfc5d9815527b67481a4b2587ba5745d')

build() {
    cd $pkgname-$pkgver
    ./configure --prefix=/usr
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
