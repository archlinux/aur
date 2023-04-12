# Maintainer: Nathan Vance <natervance@gmail.com>

pkgname=libbible
pkgver=1.0.5
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

sha256sums=('7a7d19047e5dd15fe59b831bde6f85be1966d6ddb1b6997a47ffee67a3435aa1'
            'SKIP')
