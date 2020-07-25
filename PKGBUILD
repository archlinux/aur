pkgname=cutter-test_framework
pkgver=1.2.7
pkgrel=1
pkgdesc="cutter is a C/C++ unit test framework."
targzname=cutter
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="http://cutter.sourceforge.net/index.html"
license=('FDL1.3' 'LGPL3')
source=("https://github.com/clear-code/cutter/releases/download/1.2.7/cutter-${pkgver}.tar.gz")
builddepends=(perl-xml-parser)
depends=(glib2 intltool perl pkg-config libsoup gettext perl-xml-parser)
optdepends=(gtk2 cairo pango ruby)

build() {
    cd $srcdir/$targzname-$pkgver
    ./configure --prefix=/usr \
    --localstatedir=/var \
    --sysconfdir=/etc \
    --sbindir=/usr/bin

    make
}

package() {
    cd $srcdir/$targzname-$pkgver
    make DESTDIR="$pkgdir" install
}

sha1sums=('a6294b713bc4c5574a6cf6f4ba6be1ffeabaa3b2')
