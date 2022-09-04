# Maintainer: goetzc
# Contributor: Frank Seifferth <frankseifferth@posteo.net>
pkgname=gcsvedit
pkgver=0.8.0
pkgrel=3
pkgdesc='Simple text editor for CSV, TSV and other kinds of delimiter-separated values (DSV) files.'
arch=('i686' 'x86_64')
url="https://github.com/sonnyp/gCSVedit"
license=('GPL3')
depends=('gtk3' 'libxml2' 'gtksourceview3' 'libtepl-4.so' 'gtksourceview4')
source=($pkgname-$pkgver.tar.gz::"$url/archive/refs/tags/$pkgver/0.8.0.tar.gz")

build() {
    cd $pkgname-$pkgver
    ./configure --prefix=/usr
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
sha256sums=('286c4398e5eb4eb83234bd6407bcbbb2ca19cd583f41ccb233a7611bb7beaa6f')
