# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>

pkgname=amalthea-ldc2
pkgver=1.1.0
pkgrel=1
pkgdesc="Small general library for the D programming language"
arch=('x86_64')
url="https://gitlab.com/os-18/amalthea"
license=('LGPL3')
makedepends=('make' 'bash' 'chrpath' 'lsb-release' 'glib2')
depends=('ldc')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/amalthea-v$pkgver.tar.gz")
sha256sums=('5058df85cc509f809e6b9c0eb0b5ed99e7ddf8555521bbdad1729d287a034914')

build() {
    cd "amalthea-v$pkgver"
    make || return 1
}

package() {
    # cd "${pkgname}-${pkgver}"
    cd "amalthea-v$pkgver"
    make DESTDIR=$pkgdir INCDIR=include/dlang/ldc install || return 1
}

