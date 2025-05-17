# Maintainer: Thomas Gläßle <t_glaessle@gmx.de>

pkgname=sketch
pkgver=0.3.7
pkgrel=3
pkgdesc="Small, simple system for producing line drawings of two- or three-dimensional solid objects and scenes"
arch=('i686' 'x86_64')
url="http://sketch4latex.sourceforge.net"
license=('GPL-3.0-or-later')
depends=('glibc')
source=("$url/$pkgname-$pkgver.tgz")
md5sums=('c51c6a0ed6c16a95e1a1afe1afd5d70e')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    # This is what is set in 'makefile', no easy way to extend it.
    default_cc='gcc -O1 -g -Wall'

    make CC="$default_cc -std=gnu89"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -D -m 755 sketch "$pkgdir/usr/bin/sketch"
}
