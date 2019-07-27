# Maintainer: Karol Babioch <karol@babioch.de

pkgname=xwmfs
pkgver=0.83
pkgrel=1
pkgdesc="X11 Window-Manager file system based on FUSE"
arch=('x86_64')
url="https://github.com/gerstner-hub/xwmfs"
license=('GPL2')
depends=('fuse' 'libx11')
source=("git+https://github.com/gerstner-hub/xwmfs.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    ./bootstrap
    ./configure --prefix=/usr
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="${pkgdir}" install
}

