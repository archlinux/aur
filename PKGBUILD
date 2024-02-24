# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: a821
# Contributor: urain39 <hexiedeshijie@gmail.com>

pkgname=myget
_commit=796185db5557f48e729e33d9a803fd5b38d0bfc0 # last commit
pkgver=1.1.2.r13.g796185d
pkgrel=1
pkgdesc="Multi-thread downloader accelerator for GNU/Linux (fork)"
arch=('x86_64')
url="https://myget.sourceforge.net"
license=('GPL-2.0-only')
depends=('openssl' 'gcc-libs')
makedepends=('cmake' 'git')
source=("git+https://github.com/lytsing/mytget.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
    cd mytget
    git describe --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
    cmake -B build -S mytget -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}

# vim: set ts=4 tw=60 sw=4 et:
