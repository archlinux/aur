# Maintainer: Alexey Rochev <equeim@gmail.com>

pkgname='tremotesf'
pkgver=1.2.1
pkgrel=1
pkgdesc='Remote GUI for transmission-daemon'
_reponame='tremotesf2'
url="https://github.com/equeim/${_reponame}"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qt5-base' 'kwidgetsaddons' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('bec9d869f2309f1466de0b2dcc4a3203f74daf546228cff4e6f99ae655f53ca0')

build() {
    cd "${_reponame}-${pkgver}"
    qmake PREFIX=/usr
    make
}

package() {
    cd "${_reponame}-${pkgver}"
    make INSTALL_ROOT="${pkgdir}" install
}
