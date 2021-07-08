# Maintainer: Adrián Arroyo Calle <adrian.arroyocalle@gmail.com>

pkgname=scryer-prolog
pkgver=0.8.128
pkgrel=1
pkgdesc="An open source industrial strength production environment that is also a testbed for bleeding edge research in logic and constraint programming"
arch=('i686' 'x86_64')
url="https://github.com/mthom/scryer-prolog"
license=('BSD-3-Clause')
depends=('openssl')
makedepends=('cargo')
source=("$pkgname::git+https://github.com/mthom/scryer-prolog")
sha1sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname"
    mkdir -p "$pkgdir/usr/bin"
    cp target/release/scryer-prolog "$pkgdir/usr/bin/"
}