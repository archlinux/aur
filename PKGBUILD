# Maintainer: Alexey Rochev <equeim@gmail.com>

pkgname='tremotesf'
pkgver=1.3.2
pkgrel=1
pkgdesc='Remote GUI for transmission-daemon'
_reponame='tremotesf2'
url="https://github.com/equeim/${_reponame}"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('qt5-base' 'kwidgetsaddons' 'hicolor-icon-theme')
makedepends=('qt5-tools')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('b6ba4516514916f407dbf88d6f219f534b539ffe65e4dbb3ce7b47d4ea7c5229')

build() {
    cd "${_reponame}-${pkgver}"
    qmake PREFIX=/usr
    make
}

package() {
    cd "${_reponame}-${pkgver}"
    make INSTALL_ROOT="${pkgdir}" install
}
