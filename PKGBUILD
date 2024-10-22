# Maintainer: hexchain <arch at hexchain.org>

pkgname=libkrun
pkgver=1.9.5
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
sha256sums=('17533ce6a2c76565816b3d80d69779a5972075998c34795ad98c589206549a12')
