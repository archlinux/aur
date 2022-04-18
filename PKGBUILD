# Maintainer: Nathan Vance <natervance@gmail.com>

pkgname=libbible
pkgver=1.0.4
pkgrel=1
pkgdesc="A simplified interface to the SWORD project."
arch=('x86_64')
url="https://vance.fish/git/libbible"
license=('MIT')
depends=(sword minizip)
provides=('libbible.so')
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

sha256sums=('4ed00b0b90dc63b4fc700512fc1956c8a5f34bac3f23ec1ec7d2af04b54e4cfc'
            'SKIP')
