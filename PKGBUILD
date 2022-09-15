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
sha256sums=('f9ec27a8859a10605e51a6b6f4096c57a59e759a293c57aca73e9076b2941ae6')

build() {
    cd "amalthea-v$pkgver"
    make || return 1
}

package() {
    # cd "${pkgname}-${pkgver}"
    cd "amalthea-v$pkgver"
    make DESTDIR=$pkgdir INCDIR=include/dlang/ldc install || return 1
}

