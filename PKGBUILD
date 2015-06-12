# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=mongoclock
pkgver=1.1
pkgrel=2
pkgdesc='Just a humongous clock for the terminal'
arch=(any)
url='https://github.com/maandree/mongoclock'
license=('custom: GNUAllPermissive')
depends=(sh python3 coreutils)
makedepends=(sed texinfo gzip)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=(5b0b98729626d6fdfcdae94539385b80f12d4d14a6963a019831a79c94528947)


build() {
    cd "$srcdir/mongoclock-$pkgver"
    make LIBEXEC=/lib/mongoclock
}

package() {
    cd "$srcdir/mongoclock-$pkgver"
    make LIBEXEC=/lib/mongoclock DESTDIR="${pkgdir}" install
}

