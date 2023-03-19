# Maintainer: hexchain <arch at hexchain.org>

pkgname=libkrun
pkgver=1.5.1
pkgrel=1
pkgdesc="A dynamic library providing Virtualization-based process isolation capabilities"
url='https://github.com/containers/libkrun'
arch=('x86_64')
license=('Apache')
makedepends=('cargo' 'patchelf')
depends=('glibc' 'gcc-libs' 'libkrunfw')
source=("https://github.com/containers/libkrun/archive/refs/tags/v1.5.1/$pkgname-$pkgver.tar.gz")

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr LIBDIR_Linux=lib install
}
sha256sums=('dd2ac590bfa5f238b06f1ec0a8acdd92316e2ffc2d7e261a0ad802d0849677b6')
