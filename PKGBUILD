# Maintainer: FadeMind <fademind@gmail.com>

_pkgname=xembed-sni-proxy
pkgname=${_pkgname}-git
pkgver=20150928.d581c4c
pkgrel=1
pkgdesc="Convert XEmbed system tray icons to SNI icons"
arch=('i686' 'x86_64')
url="https://github.com/davidedmundson/${_pkgname}"
license=('GPL3')
depends=(qt5-{base,x11extras} sni-qt kwindowsystem knotifications)
makedepends=('extra-cmake-modules' 'git')
source=("git+https://github.com/davidedmundson/xembed-sni-proxy.git")
sha256sums=('SKIP')

build() {
    cd ${srcdir}/${_pkgname}
    mkdir build
    cd build/
    cmake ..
    make
}

package() {
    mkdir -p "${pkgdir}/usr/bin/"
    install -m755 "${srcdir}/${_pkgname}/build/davetray" "${pkgdir}/usr/bin/davetray"
}
