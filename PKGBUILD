# Maintainer: Bruno Goncalves <bigbruno@gmail.com>
# Contributor: Mauricio de Lima <emauricio@uai21.com>

pkgname=disable-fsync
pkgver=23.07.17
_pkgver=${pkgver}-2132
pkgrel=1
arch=('any')
license=('GPL')
makedepends=('clang')
url="https://github.com/biglinux/disable-fsync"
pkgdesc="Automatic enable dbus-broker"
source=("git+https://github.com/biglinux/disable-fsync.git")
source=("https://github.com/biglinux/disable-fsync/archive/refs/tags/disable-fsync-23.07.17-2132.tar.gz")
md5sums=(SKIP)
install=disable-fsync.install

package() {
# Default Folder
        InternalDir="${srcdir}/${pkgname}-${pkgname}-${_pkgver}/${pkgname}"
        
    cd "${InternalDir}/src/"
    make
    mkdir -p "${pkgdir}/usr/lib"
    mkdir -p "${pkgdir}/usr/lib32"
    cp disable-fsync.so "${pkgdir}/usr/lib/disable-fsync.so"
    cp disable-fsync32.so "${pkgdir}/usr/lib32/disable-fsync.so"
} 
