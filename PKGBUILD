pkgname=groonga-tokenizer-friso
pkgver=1.1.0
pkgrel=1
pkgdesc="Friso tokenizer for Groonga."
arch=('i686' 'x86_64')
url="http://groonga.org/"
license=('LGPL2')
source=("https://github.com/kenhys/$pkgname/archive/v$pkgver.tar.gz")
depends=('groonga' 'friso' 'gobject-introspection')
optdepends=('cutter-test_framework')

build() {
    cd $srcdir/$pkgname-$pkgver
    ./autogen.sh
    ./configure --prefix=/usr \
    --with-friso=/usr/include/friso \
    --with-friso-ini=/etc/friso/friso.ini
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}

sha1sums=('c3cb001a178dc59675784876ae32206a7ad2d886')
