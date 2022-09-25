# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>

pkgname=fileformat
pkgver=0.4.0
pkgrel=1
pkgdesc="Tool for recognizing file formats."
arch=('x86_64')
url="https://gitlab.com/os-18/$pkgname"
license=('Boost or GPL3')
makedepends=('make' 'bash' 'chrpath' 'lsb-release' 'glib2' 'amalthea-ldc2')
depends=('amalthea-ldc2' 'glib2')
pkgfile=$pkgname-$pkgver.tar.gz
source=("$pkgfile::$url/-/archive/v$pkgver/$pkgfile")
sha256sums=('6140ee5387ed6857124484543ac19acbd8131ecfd94ee69e9ad4557d3d92e20b')

build() {
    cd "$pkgname-v$pkgver"
    make || return 1
}

package() {
    cd "$pkgname-v$pkgver"
    make DESTDIR="$pkgdir" PREFIX=usr install || return 1
}

