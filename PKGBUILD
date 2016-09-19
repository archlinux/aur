# Maintainer: Alexey Rochev <equeim@gmail.com>

pkgname='tremotesf'
pkgver=1.0.0
pkgrel=1
pkgdesc='Remote GUI for transmission-daemon'
_reponame='tremotesf2'
url="https://github.com/equeim/${_reponame}"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qt5-base' 'kwidgetsaddons' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('d4338c981fa458a817c7a9fa75c0303ba99ec8496ee054e136e325b6aee9cf33')

build() {
    cd "${_reponame}-${pkgver}"
    qmake PREFIX=/usr
    make
}

package() {
    cd "${_reponame}-${pkgver}"
    make INSTALL_ROOT="${pkgdir}" install
}
