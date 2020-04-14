# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=sfnt2woff-zopfli
pkgver=1.1.0
pkgrel=1
pkgdesc='WOFF utilities with Zopfli compression'
arch=('x86_64' 'i686')
url="https://github.com/bramstein/$pkgname"
license=('Apache' 'MPL' 'LGPL')
depends=('zlib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('86deae57d0bd0eb395f2797c370613e62c1f33dd86626a21e309b154c98efa6b')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/" {sfnt2woff,woff2sfnt}-zopfli
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}
