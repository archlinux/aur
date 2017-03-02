# Maintainer: Alexey Rochev <equeim@gmail.com>

pkgname='tremotesf'
pkgver=1.3.1
pkgrel=1
pkgdesc='Remote GUI for transmission-daemon'
_reponame='tremotesf2'
url="https://github.com/equeim/${_reponame}"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qt5-base' 'kwidgetsaddons' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('71661eb5a2b16d9bf1863c88abd3ae60f215c8f241e38fc367a6bdbdfa3ad84b')

build() {
    cd "${_reponame}-${pkgver}"
    mkdir -p build
    cd build
    qmake PREFIX=/usr ..
    make
}

package() {
    cd "${_reponame}-${pkgver}/build"
    make INSTALL_ROOT="${pkgdir}" install
}
