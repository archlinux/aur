# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>

DC=gdc
DC_PKG=gcc-d

pkgname=amalthea-${DC}
pkgver=1.3.0
pkgrel=1
pkgdesc="Small general library for the D programming language, version for ${DC^^}"
arch=('x86_64')
url="https://gitlab.com/os-18/amalthea"
license=('Boost or LGPL3')
makedepends=('make' 'bash' 'chrpath' 'lsb-release' 'glib2' 'pkgconf')
depends=("${DC}")
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/amalthea-v$pkgver.tar.gz")
sha256sums=('00bb6785f7b922ec280525b7097dab268e18046864cf4a15de3e1722204ce9d9')

build() {
    cd "amalthea-v$pkgver"
    make DC=${DC} || return 1
}

package() {
    cd "amalthea-v$pkgver"
    make DESTDIR=$pkgdir install DC=${DC} || return 1
}

