# Maintainer: Alexey Rochev <equeim@gmail.com>

pkgname='tremotesf'
pkgver=1.3.0
pkgrel=1
pkgdesc='Remote GUI for transmission-daemon'
_reponame='tremotesf2'
url="https://github.com/equeim/${_reponame}"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qt5-base' 'kwidgetsaddons' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('150696b88ad16e6d6ba03c6e487bd9769cb2cad13b19459ac4dff29d1549c243')

build() {
    cd "${_reponame}-${pkgver}"
    qmake PREFIX=/usr
    make
}

package() {
    cd "${_reponame}-${pkgver}"
    make INSTALL_ROOT="${pkgdir}" install
}
