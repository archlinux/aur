# Maintainer: Calle Erlandsson <calle@calleerlandsson.com>
pkgname=pick
pkgver=1.5.2
pkgrel=1
pkgdesc='Fuzzy text selection utility'
arch=('x86_64')
url='https://github.com/calleerlandsson/pick/'
license=('MIT')
source=('https://github.com/calleerlandsson/pick/releases/download/v1.5.2/pick-1.5.2.tar.gz'
        'https://github.com/calleerlandsson/pick/releases/download/v1.5.2/pick-1.5.2.tar.gz.asc')
validpgpkeys=('47B22252BF6914DF964BB50C24735DD835689C84')
sha1sums=('db2c3de55cc4cb20a328121e74b418934259fa13'
          'SKIP')

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

check() {
    cd "$pkgname-$pkgver"
    make -k check
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
