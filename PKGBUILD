# Maintainer: hexchain <arch at hexchain.org>

pkgname=libkrun
pkgver=1.7.2
pkgrel=1
pkgdesc="A dynamic library providing Virtualization-based process isolation capabilities"
url='https://github.com/containers/libkrun'
arch=('x86_64')
license=('Apache')
makedepends=('cargo' 'patchelf')
depends=('glibc' 'gcc-libs' 'libkrunfw')
source=("https://github.com/containers/libkrun/archive/refs/tags/v$pkgver/$pkgname-$pkgver.tar.gz")

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr LIBDIR_Linux=lib install
}
sha256sums=('b5eae842c62551e5fa5c1c13309d3051d5c1495b0ce2c66c53dfb537d0d425b1')
