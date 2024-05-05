# Maintainer: Han <maghsk2017@gmail.com>
pkgname=ac-library
pkgver=1.5.1
pkgrel=2
pkgdesc="AC Library is the official library of AtCoder."
arch=(x86_64)
url="https://github.com/atcoder/ac-library"
license=(CC0)
depends=(gcc)
makedepends=(unzip)
source=("https://github.com/atcoder/$pkgname/releases/download/v$pkgver/ac-library.zip"
        'ac-expander')
sha256sums=('6dc0becebba69bb523ce907a31966fe30d39098935ec6b4b5289c94e42634be1'
            '66fa65aa235655190559873cdd9491031149cee0c5c4c7c53086b07f677014ab')

build() {
    #mkdir $pkgname
    unzip -o ac-library.zip -d $pkgname
}

package() {
    install -d "$pkgdir"/usr/include/atcoder/
    install -d "$pkgdir"/usr/share/licenses/$pkgname/
    install -d "$pkgdir"/usr/share/doc/$pkgname/

    install -m644 "$srcdir"/ac-library/atcoder/* "$pkgdir"/usr/include/atcoder/
    install -Dm755 "$srcdir"/ac-library/expander.py "$pkgdir"/usr/bin/ac-expander.py
    install -Dm755 "$srcdir"/ac-expander "$pkgdir"/usr/bin/ac-expander

    cp -r "$srcdir"/ac-library/document_* "$pkgdir"/usr/share/doc/$pkgname/
    chmod +x "$pkgdir"/usr/share/doc/$pkgname/*

}
