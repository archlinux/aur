# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=sfnt2woff-zopfli
pkgver=1.3.1
pkgrel=1
pkgdesc='WOFF utilities with Zopfli compression'
arch=('x86_64' 'i686')
url="https://github.com/bramstein/$pkgname"
license=('Apache' 'MPL' 'LGPL')
depends=('zlib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1cc0414cf524e14bdfacab4ab1cdefd596a2023ea133e224f9d54566ef8b2a75')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/" {sfnt2woff,woff2sfnt}-zopfli
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" COPYING
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}
