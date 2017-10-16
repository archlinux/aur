# Maintainer: goetzc
# Contributor: ber532k <ber532k@gmx.de>
pkgname=gcsvedit
pkgver=0.6.0
pkgrel=1
pkgdesc='Simple text editor for CSV, TSV and other kinds of delimiter-separated values (DSV) files.'
arch=('i686' 'x86_64')
url="https://github.com/swilmet/gCSVedit"
license=('GPL3')
depends=('gtk3' 'libxml2' 'gtksourceview3' 'tepl>=3.0')
source=("https://github.com/swilmet/gCSVedit/releases/download/$pkgver/gcsvedit-$pkgver.tar.xz")
md5sums=('48f3a206da966515592da7fca6df11bc')

build() {
    cd $pkgname-$pkgver
    ./configure --prefix=/usr
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
