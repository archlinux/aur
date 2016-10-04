# Maintainer: Calle Erlandsson <calle@thoughtbot.com>
pkgname=pick
pkgver=1.5.1
pkgrel=1
pkgdesc='Fuzzy text selection utility'
arch=('x86_64')
url='https://github.com/thoughtbot/pick/'
license=('MIT')
source=('https://github.com/thoughtbot/pick/releases/download/v1.5.1/pick-1.5.1.tar.gz'
        'https://github.com/thoughtbot/pick/releases/download/v1.5.1/pick-1.5.1.tar.gz.asc')
validpgpkeys=('47B22252BF6914DF964BB50C24735DD835689C84')
sha1sums=('f9b5ad114685b83ba7203a959cd1024640492e77'
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
