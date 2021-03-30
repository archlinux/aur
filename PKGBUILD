# Maintainer: Han <maghsk2017@gmail.com>
pkgname=ac-library
pkgver=1.3
pkgrel=1
pkgdesc="AC Library is the official library of AtCoder."
arch=(x86_64)
url="https://github.com/atcoder/ac-library"
license=(CC0)
depends=(gcc)
makedepends=(unzip)
source=("https://github.com/atcoder/$pkgname/releases/download/v$pkgver/ac-library.zip")
sha256sums=('839e5219cd1e168b873915117ec6d679237d2bad69a7fbff4749b8f955dd62b5')

build() {
    #mkdir $pkgname
    unzip -o ac-library.zip -d $pkgname
}

package() {
    install -d "$pkgdir"/usr/include/atcoder/
    install -d "$pkgdir"/usr/share/licenses/$pkgname/
    install -d "$pkgdir"/usr/share/doc/$pkgname/

    install -m644 "$srcdir"/ac-library/atcoder/* "$pkgdir"/usr/include/atcoder/
    install -m644 "$srcdir"/ac-library/atcoder/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dm755 "$srcdir"/ac-library/expander.py "$pkgdir"/usr/bin/ac-expander.py

    cp -r "$srcdir"/ac-library/document_* "$pkgdir"/usr/share/doc/$pkgname/
    chmod +x "$pkgdir"/usr/share/doc/$pkgname/*

    rm "$pkgdir"/usr/include/atcoder/LICENSE
}
