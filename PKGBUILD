# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Upstream ships no LICENSE file; the only licence text in the tree is the MIT
# grant heading the vendored klib headers, so that is what gets installed.

pkgname=tabtk
pkgver=0.1
pkgrel=1
pkgdesc="Toolkit for processing tab-delimited files"
arch=('x86_64')
url="https://github.com/lh3/tabtk"
license=('MIT')
depends=('glibc' 'zlib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('311df21ef04b4d396a7552ce1384bf056e1d6f87a5679d55e905ec6c8591b906')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 tabtk "$pkgdir/usr/bin/tabtk"
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    awk 'NR==1,/^\*\//' kseq.h > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
