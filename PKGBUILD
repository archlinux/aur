# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>
# Contributor: Alad Wenter <alad@mailbox.org>
# Contributor: Alex Griffin <griffin.aj@gmail.com>

pkgname=xss
pkgver=1.0
pkgrel=1
pkgdesc='A collection of small programs to compose your own screensaver or screenlocker'
arch=('i686' 'x86_64')
url='https://github.com/9wm/xss'
license=('GPL3')
depends=('libxss')
source=("$pkgname-$pkgver.tar.gz::https://github.com/9wm/xss/archive/$pkgver.tar.gz")
sha256sums=('1791ab3f75279d264c3711b32db00535218f361213d6bc6ab428030524cf13fb')

build() {
    cd "$pkgname-$pkgver"
    make
}

package() {
    cd "$pkgname-$pkgver"
    install -d "$pkgdir"/usr/bin/

    make BINDIR="$pkgdir"/usr/bin/ install
    install -m644 -D README.md "$pkgdir"/usr/share/doc/$pkgname/README
}
