# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=xbanish
pkgver=1.8
pkgrel=1
pkgdesc='Hide the mouse cursor when typing'
url='https://github.com/jcs/xbanish'
arch=('i686' 'x86_64')
license=('BSD')
depends=('libxfixes' 'libxi')
makedepends=('libxt')

source=("https://github.com/jcs/xbanish/archive/v${pkgver}.zip")
md5sums=('f12dc9e095d5586a507ad154940358e9')

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
