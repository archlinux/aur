# Maintainer: Matthew Taylor <mtaylor1252dev@gmail.com>

pkgname=cdynarr
pkgver=0.4.0
pkgrel=1
pkgdesc="C library implementing dynamic arrays."
arch=("x86_64")
url="https://gitlab.com/ymber/cdynarr"
license=("MIT")
source=(https://gitlab.com/ymber/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=("e7a1d77b917ee3f699597cd67a8f84af42e65038c5abbe04fdbd45d579a9ac8e")

build() {
    cd $srcdir/$pkgname-$pkgver
    make CC=gcc release
}

package() {
    cd $srcdir/$pkgname-$pkgver
    install -Dm644 build/release/libcdynarr.a $pkgdir/usr/lib/libcdynarr.a
    install -Dm644 src/cdynarr.h $pkgdir/usr/include/$pkgname/cdynarr.h
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

