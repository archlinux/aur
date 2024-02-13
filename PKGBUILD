pkgname=cutter-test_framework
pkgver=1.2.8
pkgrel=1
pkgdesc="cutter is a C/C++ unit test framework."
targzname=cutter
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="http://cutter.sourceforge.net/index.html"
license=('FDL1.3' 'LGPL3')
source=("https://github.com/clear-code/cutter/archive/refs/tags/${pkgver}.tar.gz")
builddepends=(perl-xml-parser gtk-doc)
depends=(glib2 intltool perl pkg-config libsoup gettext perl-xml-parser)
optdepends=(gtk2 cairo pango ruby)

build() {
    cd $srcdir/$targzname-$pkgver
    ./autogen.sh
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

sha1sums=('06c92b3165b3174cd1ac970efd17a11570db8356')
sha256sums=('af29d3d61076fc03313fc1b8da76aa8b884edf683e684898be5d33ba8440df14')
