# Maintainer: Nathan Vance <natervance@gmail.com>

pkgname=libbible
pkgver=1.0.2
pkgrel=2
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

sha256sums=('598a4e5af653ce06c6dbe53e58a83847e3286578fe105bf2c304ff1c66f17e9c'
            'SKIP')
