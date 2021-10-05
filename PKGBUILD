# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>

pkgname=amalthea-ldc2
pkgver=1.0.1
pkgrel=1
pkgdesc="Small general library for the D programming language"
arch=('x86_64')
url="https://gitlab.com/os-18/amalthea"
license=('LGPL3')
makedepends=('make' 'bash' 'chrpath' 'lsb-release' 'glib2')
depends=('ldc')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/amalthea-v$pkgver.tar.gz")
sha256sums=('a5996fa2415cc8ec1fc64ddb7b060686e8c526cf07d8b1c3aa7e83b812d589de')

build() {
    cd "amalthea-v$pkgver"
    make || return 1
}

package() {
    # cd "${pkgname}-${pkgver}"
    cd "amalthea-v$pkgver"
    make DESTDIR=$pkgdir INCDIR=include/dlang/ldc install || return 1
}

