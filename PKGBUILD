pkgname=groonga-normalizer-mysql
pkgver=1.1.3
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
    make DESTDIR="$pkgdir" install
}

sha1sums=('54578549baf1cc23511330f2e9ba57d0e25b572a')
