# Maintainer: zaps166 <spaz16 at wp dot pl>

_pkgname=xfce4-dpr-changer
pkgname=${_pkgname}-git
pkgver=r3.g8e44ffa
pkgrel=1
pkgdesc="Change display scaling from system tray in Xfce4 desktop"
arch=('x86_64')
url='https://github.com/zaps166/xfce4-dpr-changer'
license=('Unlicense')
depends=('qt6-base')
makedepends=('cmake' 'git')
source=("git+https://github.com/zaps166/xfce4-dpr-changer.git")
sha1sums=(SKIP)
provides=(${_pkgname})
conflits=(${_pkgname})

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
