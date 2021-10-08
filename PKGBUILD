# Maintainer: goetzc
# Contributor: Frank Seifferth <frankseifferth@posteo.net>
pkgname=gcsvedit
pkgver=0.8.0
pkgrel=2
pkgdesc='Simple text editor for CSV, TSV and other kinds of delimiter-separated values (DSV) files.'
arch=('i686' 'x86_64')
url="https://github.com/swilmet/gCSVedit"
license=('GPL3')
depends=('gtk3' 'libxml2' 'gtksourceview3' 'libtepl-4.so' 'gtksourceview4')
source=("https://github.com/swilmet/gCSVedit/releases/download/$pkgver/gcsvedit-$pkgver.tar.xz")

build() {
    cd $pkgname-$pkgver
    ./configure --prefix=/usr
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}

sha256sums=('5d1f49d1e21b2b682cab83296a16f345cbb8fcc5f6c803b4e16a254b59ebb9aa')
