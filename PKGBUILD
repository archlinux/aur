# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=xbanish
pkgver=1.6
pkgrel=2
pkgdesc='Hide the mouse cursor when typing'
url='https://github.com/jcs/xbanish'
arch=('i686' 'x86_64')
license=('BSD')
depends=('libxfixes' 'libxi' 'libxt')

source=("https://github.com/jcs/xbanish/archive/v${pkgver}.zip")
md5sums=('7b6b07a71f28b19087e252db90b5990d')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 xbanish "$pkgdir/usr/bin/xbanish"
    install -Dm644 xbanish.1 "$pkgdir/usr/share/man/man1/xbanish.1"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
