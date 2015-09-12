# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=mongoclock
pkgver=2
pkgrel=2
pkgdesc='Just a humongous clock for the terminal'
arch=(any)
url='https://github.com/maandree/mongoclock'
license=('custom: GNUAllPermissive')
depends=(glibc linux)
makedepends=(linux-api-headers general-preprocessor)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(7182798bf59686360bebdd939f252929755c54d0de52946aaa5a7b6329b469e4)


build() {
    cd "$srcdir/mongoclock-$pkgver"
    make
}

package() {
    cd "$srcdir/mongoclock-$pkgver"
    make DESTDIR="${pkgdir}" install
}

