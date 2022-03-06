# Maintainer: Adrián Arroyo Calle <adrian.arroyocalle@gmail.com>

pkgname=scryer-prolog
pkgver=0.9.0
pkgrel=1
pkgdesc="An open source industrial strength production environment that is also a testbed for bleeding edge research in logic and constraint programming"
arch=('i686' 'x86_64')
url="https://github.com/mthom/scryer-prolog"
license=('BSD-3-Clause')
depends=('openssl')
makedepends=('cargo')
source=("https://github.com/mthom/scryer-prolog/archive/refs/tags/v${pkgver}.tar.gz")
sha1sums=('d5e0629d2677dba9694991a4a8f66bdb6ba5af30')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p "$pkgdir/usr/bin"
    cp target/release/scryer-prolog "$pkgdir/usr/bin/"
}