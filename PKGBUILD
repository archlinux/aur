# Maintainer: zaps166 <spaz16 at wp dot pl>

_pkgname=xfce4-mate-applet-loader-plugin
pkgname=${_pkgname}-git
pkgver=r1.g39ae2bb
pkgrel=1
pkgdesc='Load MATE applets into Xfce4 panel'
arch=('x86_64')
url='https://github.com/zaps166/xfce4-mate-applet-loader-plugin'
license=('MIT')
depends=('xfce4-panel' 'libxfce4util')
optdepends=('mate-applets')
makedepends=('cmake')
source=("git+https://github.com/zaps166/xfce4-mate-applet-loader-plugin.git")
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
