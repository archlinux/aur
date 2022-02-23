# Maintainer: Nathan Vance <natervance@gmail.com>

pkgname=libbible
pkgver=1.0.2
pkgrel=1
pkgdesc="A simplified interface to the SWORD project."
arch=('x86_64')
url="https://vance.fish/git/libbible"
license=('MIT')
depends=(sword minizip)
provides=('libbible.so=libbible.so.1')
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

sha256sums=('987369d95d9e645e32b23ed96878c5eaa469076f0d8604cec6060c8860b85de6'
            'SKIP')
