# Maintainer: hexchain <arch at hexchain.org>

pkgname=libkrun
pkgver=1.8.1
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
sha256sums=('836127b03d88a954431eba3b7a76da8794c7e738568e16954eab3baf6dd55ca9')
