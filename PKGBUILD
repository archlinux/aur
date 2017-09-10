# Maintainer: Alad Wenter <alad@mailbox.org>
# Contributor: Alex Griffin <griffin.aj@gmail.com>
pkgname=xss
pkgver=20120302
pkgrel=3
pkgdesc="A collection of small programs to compose your own screensaver or screenlocker"
arch=('i686' 'x86_64')
url='https://github.com/9wm/xss'
license=('GPL3')
depends=('libxss')
source=("$pkgname-$pkgver.zip::https://github.com/9wm/xss/archive/master.zip")
sha256sums=('0325ffb17b3b6050cbaed75fcf249245301a3bee5ff4f9accd62c13c0e86572d')

build() {
    cd "$pkgname-master"
    make
}

package() {
    cd "$pkgname-master"
    install -d "$pkgdir"/usr/bin/
    make BINDIR="$pkgdir"/usr/bin/ install
    install -m644 -D README.md "$pkgdir"/usr/share/doc/$pkgname/README
}
