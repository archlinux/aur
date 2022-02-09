# Maintainer: Nathan Vance <natervance@gmail.com>

pkgname=libbible
pkgver=1.0.1
pkgrel=1
pkgdesc="This library provides a simplified interface to the SWORD project."
arch=('x86_64')
url="https://vance.fish/git/libbible/"
license=('MIT')
source=("$url/snapshot/$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
