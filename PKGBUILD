# Maintainer: Han <maghsk2017@gmail.com>
pkgname=ac-library
pkgver=1.6
pkgrel=1
pkgdesc="AC Library is the official library of AtCoder."
arch=(x86_64)
url="https://github.com/atcoder/ac-library"
license=(CC0)
depends=(gcc)
makedepends=(unzip)
source=("https://github.com/atcoder/$pkgname/archive/refs/tags/v$pkgver.zip")
sha256sums=('bd6972dc842fd8ecc7c8ffac1d3fb5ee951a3c86e01955ecf8387c8df01101a5')

package() {
    install -d "$pkgdir"/usr/include/atcoder/
    install -d "$pkgdir"/usr/share/licenses/$pkgname/
    install -d "$pkgdir"/usr/share/doc/$pkgname/

    install -m644 "$srcdir"/${pkgname}-${pkgver}/atcoder/* "$pkgdir"/usr/include/atcoder/
    install -Dm755 "$srcdir"/${pkgname}-${pkgver}/expander.py "$pkgdir"/usr/bin/ac-expander.py

    cp -r "$srcdir"/${pkgname}-${pkgver}/document_* "$pkgdir"/usr/share/doc/$pkgname/
    chmod +x "$pkgdir"/usr/share/doc/$pkgname/*
}
