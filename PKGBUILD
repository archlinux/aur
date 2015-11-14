pkgname=cutter-test_framework
pkgver=1.2.5
pkgrel=2
pkgdesc="cutter is a C/C++ unit test framework."
targzname=cutter
arch=('i686' 'x86_64' 'armv7h')
url="http://cutter.sourceforge.net/index.html"
license=('FDL1.3' 'LGPL3')
source=("http://downloads.sourceforge.net/project/cutter/cutter/$pkgver/$targzname-$pkgver.tar.gz")
depends=(glib2 intltool perl pkg-config libsoup gettext)
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

sha1sums=('1b55df677a1b1918e0d4e44615e6234125be41f6')
