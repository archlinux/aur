# Maintainer: tjbp (archlinux@tjbp.net)

pkgname=libac
pkgver=2.0.0
pkgrel=1
pkgdesc='Library of miscellaneous utility functions'
arch=('x86_64' 'i686')
url='https://github.com/ac000/libac'
license=('LGPL-2.1-only')
source=("https://github.com/ac000/libac/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8cef2d7478125c0f3de98e6035478cd8da2457d215ed075209660310f1e72344')

build() {
    cd libac-$pkgver
    make
}

package() {
    cd libac-$pkgver

    install -Dp -m644 src/include/libac.h $pkgdir/usr/include/libac.h
    install -Dp -m0755 src/libac.so.$pkgver $pkgdir/usr/lib/libac.so.$pkgver

    cd $pkgdir/usr/lib
    ln -s libac.so.2 libac.so
}
