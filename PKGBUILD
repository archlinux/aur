# Maintainer: hexchain <arch at hexchain.org>

pkgname=libkrun
pkgver=1.9.3
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
sha256sums=('bac502379167c8bb9242c3873d817780c3107e85ec00f0a5ac8d47b9eec1b6d9')
