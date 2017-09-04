# Maintainer: goetzc
# Contributor: ber532k <ber532k@gmx.de>
pkgname=gcsvedit
pkgver=0.4.1
pkgrel=1
pkgdesc='Simple text editor for CSV, TSV and other kinds of delimiter-separated values (DSV) files.'
arch=('i686' 'x86_64')
url="https://github.com/swilmet/gCSVedit"
license=('GPL3')
depends=('gtk3' 'libxml2' 'gtksourceview3' 'tepl')
source=("https://github.com/swilmet/gCSVedit/releases/download/$pkgver/gcsvedit-$pkgver.tar.xz")
md5sums=('2b4c3a4886aad08a2e427226dfd41114')

build() {
    cd $pkgname-$pkgver
    ./configure --prefix=/usr
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
