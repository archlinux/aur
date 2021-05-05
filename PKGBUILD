# Maintainer: Philipp Fent <philipp@fent.de>

pkgname=sqlsmith
pkgver=1.2.1
pkgrel=1
pkgdesc="SQLsmith: A random SQL query generator"
arch=('x86_64')
url="https://github.com/anse1/sqlsmith"
license=(GPL3)
makedepends=('cmake' 'ninja' 'autoconf-archive')
depends=('libpqxx' 'boost-libs' 'sqlite')
source=("https://github.com/anse1/sqlsmith/releases/download/v$pkgver/sqlsmith-$pkgver.tar.gz")
sha256sums=('a136a8162487555e6aded49c7082189eacf0117cf2c64456c3bc0838071bcb00')

build() {
    cd "$srcdir/sqlsmith-$pkgver/"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/sqlsmith-$pkgver/"
    make DESTDIR="$pkgdir" install
}
