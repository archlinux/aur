# Maintainer: Thomas Gläßle <t_glaessle@gmx.de>

pkgname=setcapslock
pkgver=0.0.4
pkgrel=1
pkgdesc="Small utility to set the caps lock state in an X session."
arch=('i686' 'x86_64')
url="https://github.com/coldfix/setcapslock"
license=('custom:UNLICENSE')
depends=('libx11')
source=("$url/archive/${pkgver}.tar.gz")
md5sums=('6b6be3209e635724eb761fd2889b8a70')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -D -m 644 UNLICENSE "$pkgdir/usr/share/licenses/$pkgname/UNLICENSE"
    # for convenience install upper and lower case versions:
    install -D -m 755 setcapslock "$pkgdir/usr/bin/setcapslock"
    install -D -m 755 setcapslock "$pkgdir/usr/bin/SETCAPSLOCK"
}
