# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=ropebwt3
pkgver=3.10
pkgrel=1
pkgdesc="BWT construction and search for highly repetitive genomes"
arch=('x86_64')
url="https://github.com/lh3/ropebwt3"
license=('MIT')
depends=('glibc' 'libgomp' 'zlib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('072231015c834d7ffcdc621c9ae260dafebf9f22ed9a780fe0026c2e0a845c5a')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 ropebwt3 "$pkgdir/usr/bin/ropebwt3"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
