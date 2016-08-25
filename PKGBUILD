# Maintainer: goetzc
pkgname=gcsvedit
pkgver=0.2.2
pkgrel=1
pkgdesc='Simple text editor for CSV, TSV and other kinds of delimiter-separated values (DSV) files.'
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/gcsvedit/"
license=('GPL3')
depends=('gtk3' 'libxml2' 'gtksourceview3')
source=(http://downloads.sourceforge.net/project/gcsvedit/v0.2/gcsvedit-0.2.2.tar.xz)
md5sums=('2c6b0a315704d4091edfb06913a65f94')

build() {
    cd $pkgname-$pkgver
    ./configure --prefix=/usr
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
