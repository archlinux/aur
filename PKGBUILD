# Maintainer: Alexey Rochev <equeim@gmail.com>

pkgname='tremotesf'
pkgver=1.9.1
pkgrel=1
pkgdesc='Remote GUI for transmission-daemon'
_reponame='tremotesf2'
url="https://github.com/equeim/${_reponame}"
arch=('x86_64')
license=('GPL3')
depends=('qt5-base' 'qt5-x11extras' 'kwidgetsaddons' 'kwindowsystem' 'hicolor-icon-theme')
makedepends=('qt5-tools' 'cmake' 'ninja' 'gettext')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('2c0eca078be2962f5b0b55070ebc04a01c7279343f5a860fd7e6031af7489ddb')

build() {
    cmake -B build -S "${_reponame}-${pkgver}" \
        -G Ninja \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
