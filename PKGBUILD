pkgname=gitstats
_name=gitstats-cli
pkgver=1.1.0
pkgrel=1
pkgdesc="Lightweight GitHub statistics CLI using GraphQL"
arch=('x86_64')
url="https://github.com/andregarcia0412/gitstats-cli"
license=('MIT')

depends=('curl')
makedepends=('make' 'gcc')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")

sha256sums=('SKIP')

build() {
    cd "$srcdir/$_name-$pkgver"

    make
}

package() {
    cd "$srcdir/$_name-$pkgver"

    make DESTDIR="$pkgdir" PREFIX=/usr install
}
