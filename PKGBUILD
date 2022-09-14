# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>

pkgname=amalthea-ldc2
pkgver=1.2.1
pkgrel=1
pkgdesc="Small general library for the D programming language"
arch=('x86_64')
url="https://gitlab.com/os-18/amalthea"
license=('Boost or LGPL3')
makedepends=('make' 'bash' 'chrpath' 'lsb-release' 'glib2')
depends=('ldc')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/amalthea-v$pkgver.tar.gz")
sha256sums=('3465a1ec7b61e9193de15bdafccc805ae0f86c340ea7f4fee4d54eb14ab1f90c')

build() {
    cd "amalthea-v$pkgver"
    make || return 1
}

package() {
    # cd "${pkgname}-${pkgver}"
    cd "amalthea-v$pkgver"
    make DESTDIR=$pkgdir INCDIR=include/dlang/ldc install || return 1
}

