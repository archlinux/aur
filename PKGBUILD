# Maintainer: Anthony Vitacco <anthony@littlegno.me>
# Contributor: Jente Hidskes <hjdskes@gmail.com>

pkgname=gcolor3
pkgver=2.1
pkgrel=1
pkgdesc="A simple color selection dialog in GTK3"
arch=('i686' 'x86_64')
url="http://unia.github.io/gcolor3/"
license=('GPL2')
depends=('gtk3' 'hicolor-icon-theme')
makedepends=('intltool' 'gnome-common')
conflicts=('gcolor3-git')
source=(https://github.com/Unia/gcolor3/archive/v$pkgver.tar.gz)
install=gcolor3.install
sha256sums=('b7f65c0a44eb52622bf59bd04c15f01e05414167d86c3862863c0f91da60dab9')

build() {
    cd "$srcdir"/$pkgname-$pkgver
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
