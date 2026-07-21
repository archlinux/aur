# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: a821
# Contributor: urain39 <hexiedeshijie@gmail.com>

pkgname=myget
pkgver=1.1.3
pkgrel=1
pkgdesc="Multi-thread downloader accelerator for GNU/Linux (fork)"
arch=('x86_64')
url="https://myget.sourceforge.net"
license=('GPL-2.0-only')
depends=('openssl' 'gcc-libs')
makedepends=('cmake' 'git')
source=("git+https://github.com/lytsing/mytget.git#tag=v$pkgver")
sha256sums=('b07bd0f4113ef108312826d806fee615e16b33934ec168eb8430b6d0b6cad43c')

build() {
    cmake -B build -S mytget -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}

# vim: set ts=4 tw=60 sw=4 et:
