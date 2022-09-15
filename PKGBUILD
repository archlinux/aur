# Maintainer: Eugene 'Vindex' Stulin <tech.vindex@gmail.com>

DC=dmd
DC_PKG=${DC}

pkgname=amalthea-${DC}
pkgver=1.2.1
pkgrel=1
pkgdesc="Small general library for the D programming language, version for ${DC^^}"
arch=('x86_64')
url="https://gitlab.com/os-18/amalthea"
license=('Boost or LGPL3')
makedepends=('make' 'bash' 'chrpath' 'lsb-release' 'glib2')
depends=("${DC}")
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/amalthea-v$pkgver.tar.gz")
sha256sums=('f9ec27a8859a10605e51a6b6f4096c57a59e759a293c57aca73e9076b2941ae6')

build() {
    cd "amalthea-v$pkgver"
    make DC=${DC} || return 1
}

package() {
    cd "amalthea-v$pkgver"
    make DESTDIR=$pkgdir install DC=${DC} || return 1
}

