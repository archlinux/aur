# Maintainer: zaps166 <spaz16 at wp dot pl>

_pkgname=mate-xfce-tool
pkgname=${_pkgname}-git
pkgver=r4.ge3e2603
pkgrel=1
pkgdesc='Fix MATE desktop after screen change, switch xfwm4 HiDPI sttyle, reload xfce4-panel on DPR change'
arch=('x86_64')
url='https://github.com/zaps166/mate-xfce-tool'
license=('Unlicense')
makedepends=('cmake')
source=("git+https://github.com/zaps166/mate-xfce-tool.git")
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
