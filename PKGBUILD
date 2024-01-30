# Maintainer: Nathan Vance <natervance@gmail.com>

pkgname=libbible
pkgver=1.0.6
pkgrel=1
pkgdesc="A simplified interface to the SWORD project."
arch=('x86_64')
url="https://vance.fish/git/libbible"
license=('MIT')
depends=(sword minizip glibc gcc-libs)
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

sha256sums=('398cc1a402cfc8358ebb5df861ca20d0f6928c96e9995f5c7bee745a6d7bd66c'
            'SKIP')
