# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=mongoclock
pkgver=2.1
pkgrel=1
pkgdesc='Just a humongous clock for the terminal'
arch=(any)
url='https://github.com/maandree/mongoclock'
license=('custom: GNUAllPermissive')
depends=(glibc linux)
makedepends=(linux-api-headers general-preprocessor)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(5a4747c320861db61769ff5e98f5c3ad6bcbe9467db7e7ead9893ea7f5c2f52b)


build() {
    cd "$srcdir/mongoclock-$pkgver"
    make
}

package() {
    cd "$srcdir/mongoclock-$pkgver"
    make DESTDIR="${pkgdir}" install
}

