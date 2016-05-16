# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Peter Nguyen <peter.hieu.nguyen@gmail.com>

pkgname=mongrel2
pkgver=1.11.0
pkgrel=1
pkgdesc="Application, language, and network architecture agnostic web server"
url="http://mongrel2.org"
license=("BSD")
arch=("i686" "x86_64")
depends=("sqlite3" "zeromq")
source=("https://github.com/mongrel2/mongrel2/releases/download/v$pkgver/$pkgname-v$pkgver.tar.bz2")
sha256sums=('917f2ce07c0908cae63ac03f3039815839355d46568581902377ba7e41257bed')

build() {
    cd "$srcdir"/$pkgname-v$pkgver
    make
}

check() {
    cd "$srcdir"/$pkgname-v$pkgver
    make tests
}

package() {
    cd "$srcdir"/$pkgname-v$pkgver
    make PREFIX="$pkgdir"/usr install
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
