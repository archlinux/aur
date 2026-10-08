# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=minipileup
pkgver=1.4b
pkgrel=1
pkgdesc="Simple pileup-based variant caller"
arch=('x86_64')
url="https://github.com/lh3/minipileup"
license=('MIT')
depends=('glibc' 'zlib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('131efd240e12bb3c54d923b1b90e70055e34ed780dc4d20dbe418e42dba29d00')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 minipileup "$pkgdir/usr/bin/minipileup"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
