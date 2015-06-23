pkgname=groonga-normalizer-mysql
pkgver=1.1.0
pkgrel=2
pkgdesc="A MySQL compatible normalizer plugin for groonga."
arch=('i686' 'x86_64')
url="http://mroonga.org/"
license=('LGPL2')
source=("http://packages.groonga.org/source/groonga-normalizer-mysql/$pkgname-$pkgver.tar.gz")
depends=('groonga cmake')
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

sha1sums=('f828062e5ab63fc2136eed380bc5463b7031f793')
