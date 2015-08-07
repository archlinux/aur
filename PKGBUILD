# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=xbanish
pkgver=1.4
pkgrel=1
pkgdesc='Hide the mouse cursor when typing'
url='https://github.com/jcs/xbanish'
arch=('i686' 'x86_64')
license=('BSD')
depends=('libxfixes' 'libxi')

source=("https://github.com/jcs/xbanish/archive/v${pkgver}.zip")
md5sums=('ffac47102f23be72e4372142614ff351')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 xbanish "$pkgdir/usr/bin/xbanish"
    install -Dm644 xbanish.1 "$pkgdir/usr/share/man/man1/xbanish.1"
    install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}
