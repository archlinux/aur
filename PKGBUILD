# Maintainer: Philipp Fent <philipp@fent.de>

pkgname=sqlsmith
pkgver=1.3
pkgrel=1
pkgdesc="SQLsmith: A random SQL query generator"
arch=('x86_64')
url="https://github.com/anse1/sqlsmith"
license=(GPL3)
makedepends=('cmake' 'ninja' 'autoconf-archive')
depends=('libpqxx' 'boost-libs' 'sqlite')
source=("https://github.com/anse1/sqlsmith/releases/download/v$pkgver/sqlsmith-$pkgver.tar.gz")
sha256sums=('11840c1edb523bdb192073abf8af8a83025538f417426aac69ee52035c7f7578')

build() {
    cd "$srcdir/sqlsmith-$pkgver/"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/sqlsmith-$pkgver/"
    make DESTDIR="$pkgdir" install
}
