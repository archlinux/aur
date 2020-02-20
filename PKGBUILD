pkgname=groonga-normalizer-mysql
pkgver=1.1.4
pkgrel=1
pkgdesc="A MySQL compatible normalizer plugin for groonga."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="http://mroonga.org/"
license=('LGPL2')
source=("http://packages.groonga.org/source/groonga-normalizer-mysql/$pkgname-$pkgver.tar.gz")
depends=('groonga' 'cmake')
optdepends=('cutter-test_framework')

build() {
    cd $srcdir/$pkgname-$pkgver
    cmake .

    make
}

package() {
    cd $srcdir/$pkgname-$pkgver
    install -D -m0644 groonga-normalizer-mysql.pc "$pkgdir"/usr/lib/pkgconfig/groonga-normalizer-mysql.pc

    make DESTDIR="$pkgdir" install
}

sha1sums=('fd12b12515c3296ce6d868e6e88ae622ab085481')
