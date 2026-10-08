# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=longdust
pkgver=1.4
pkgrel=1
pkgdesc="Finder of long tandem repeats and low-complexity regions in DNA"
arch=('x86_64')
url="https://github.com/lh3/longdust"
license=('MIT')
depends=('glibc' 'zlib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('24d949e46ad5db1f259759ea8b692845803bf23674c79d951db0c66b8d4c27fb')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 longdust "$pkgdir/usr/bin/longdust"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
