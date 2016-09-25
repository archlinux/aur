# Maintainer: Alexey Rochev <equeim@gmail.com>

pkgname='tremotesf'
pkgver=1.1.0
pkgrel=1
pkgdesc='Remote GUI for transmission-daemon'
_reponame='tremotesf2'
url="https://github.com/equeim/${_reponame}"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qt5-base' 'kwidgetsaddons' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('9c2641dfb5f316f2a8ad477a788ee8581c5f226ed7ef2dc5b344f59ecc587d6f')

build() {
    cd "${_reponame}-${pkgver}"
    qmake PREFIX=/usr
    make
}

package() {
    cd "${_reponame}-${pkgver}"
    make INSTALL_ROOT="${pkgdir}" install
}
