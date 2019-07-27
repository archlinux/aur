# Maintainer: Karol Babioch <karol@babioch.de

pkgname=xwmfs-git
pkgver=0.83.r2.gd931124
pkgrel=1
pkgdesc="X11 Window-Manager file system based on FUSE"
arch=('x86_64')
url="https://github.com/gerstner-hub/xwmfs"
license=('GPL2')
depends=('fuse' 'libx11')
source=("git+https://github.com/gerstner-hub/xwmfs.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/xwmfs"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/xwmfs"
    ./bootstrap
    ./configure --prefix=/usr
}

package() {
    cd "${srcdir}/xwmfs"
    make DESTDIR="${pkgdir}" install
}

