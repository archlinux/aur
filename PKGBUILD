# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>

pkgname=fileformat
pkgver=0.3.1
pkgrel=1
pkgdesc="Tool for recognizing file formats."
arch=('x86_64')
url="https://gitlab.com/os-18/$pkgname"
license=('GPL3')
makedepends=('make' 'bash' 'chrpath' 'lsb-release' 'glib2' 'amalthea-ldc2')
depends=('amalthea-ldc2' 'glib2')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('99df57f41b0949bdbd5b01fdbf20999145d0237091e4aa855352aff005bd9251')

build() {
    cd "$pkgname-v$pkgver"
    make || return 1
}

package() {
    cd "$pkgname-v$pkgver"
    make DESTDIR="$pkgdir" PREFIX=usr install || return 1
}

