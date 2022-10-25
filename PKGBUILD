# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=kodi-addon-vfs-libarchive
pkgver=19.0.1
_codename=Matrix
pkgrel=1
pkgdesc="Kodi VFS addon to support archives"
arch=('x86_64')
url='https://github.com/xbmc/vfs.libarchive'
license=('GPL')
groups=('kodi-addons')
depends=('kodi')
makedepends=('cmake' 'kodi-dev')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/xbmc/vfs.libarchive/archive/${pkgver}-${_codename}.tar.gz")

build() {
    cd "vfs.libarchive-${pkgver}-${_codename}"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    cd "vfs.libarchive-${pkgver}-${_codename}"
	make DESTDIR="$pkgdir/" install
}

sha256sums=('1360154d86bc73fc6f01f546d7b09a92968653cf05b037b0cd80a825d95a9187')
