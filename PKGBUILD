# Maintainer: zaps166 <spaz16 at wp dot pl>

_pkgname=xfce4-no-sleep-on-battery-lid-closed
pkgname=${_pkgname}-git
pkgver=r1.g76401cf
pkgrel=1
pkgdesc="Don't suspend if you have external display connected when running on laptop's battery in MATE desktop"
arch=('x86_64')
url='https://github.com/zaps166/xfce4-no-sleep-on-battery-lid-closed'
license=('Unlicense')
makedepends=('cmake')
source=("git+https://github.com/zaps166/xfce4-no-sleep-on-battery-lid-closed.git")
sha1sums=(SKIP)

pkgver() {
    cd ${_pkgname}
    echo r$(git rev-list --all --count).g$(git rev-parse --short HEAD)
}

build() {
    cd ${_pkgname}
    cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd ${_pkgname}
    make DESTDIR="${pkgdir}" install
}
