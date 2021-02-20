# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@kth.se>

pkgname=pylibcoopgamma
pkgver=1.1.3
pkgrel=1
pkgdesc="Cooperative gamma Python 3 library"
arch=(i686 x86_64)
url="https://github.com/maandree/pylibcoopgamma"
license=('custom:ISC')
depends=('python>=3.4' libcoopgamma)
makedepends=('python>=3.4' libcoopgamma cython)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(158b2eb6e8ad1366a96da12bc5c5c9f74bd02449e6a6caa1b9d9bc28f4301741)


build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make install DESTDIR="$pkgdir"
}
