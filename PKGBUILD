# Maintainer: Anthony Vitacco <anthony@littlegno.me>
# Contributor: Jente Hidskes <hjdskes@gmail.com>

pkgname=gcolor3
pkgver=2.2
pkgrel=1
pkgdesc="A simple color selection dialog in GTK3"
arch=('i686' 'x86_64')
url="http://hjdskes.github.io/projects/gcolor3/"
license=('GPL2')
depends=('gtk3' 'hicolor-icon-theme')
makedepends=('intltool' 'gnome-common')
conflicts=('gcolor3-git')
source=(https://github.com/Hjdskes/gcolor3/archive/v$pkgver.tar.gz)
sha256sums=('a3f67108ef7524b424b774b4b68332e45371703f61d659ce7ca1da47c7fb5590')

build() {
    cd "$srcdir"/$pkgname-$pkgver
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
