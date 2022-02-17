# Maintainer: Nathan Vance <natervance@gmail.com>

pkgname=libbible
pkgver=1.0.1
pkgrel=1
pkgdesc="This library provides a simplified interface to the SWORD project."
arch=('x86_64')
url="https://vance.fish/git/libbible/"
license=('MIT')
depends=(sword minizip)
source=($url/snapshot/$pkgname-$pkgver.tar.gz{,.asc})
validpgpkeys=('2FCF3A100A5B5C0E78E41BDB215A56B23729BC81') # Nathan Vance <natervance@gmail.com>

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('b790706f5b4381ebc2c3f7894f4cb5ed4cfd268f51418747382f0dc79ae33ff7'
            'SKIP')
