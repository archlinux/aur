# Maintainer: Feresey <p.milko1999@yandex.ru>
pkgname=exo-player
_gitname=exo
arch=(x86_64)
pkgdesc="eXo music player based on mocp, with QT5 graphics"
pkgver=9.0
pkgrel=3
source=(git://github.com/Feresey/exo)
url=https://github.com/loimu/exo
sha1sums=('SKIP')
license=(GPL)
makedepends=(gcc cmake git)
depends=(liblastfm-qt5 hicolor-icon-theme python)
optdepends=("python-notify2: for moc-osd")

prepare() {
	cd "${srcdir}/${_gitname}"
    [[ ! -d build ]] && mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" -DCMAKE_BUILD_TYPE=Release
}

build() {
	cd "${srcdir}/${_gitname}"/build
    make
}

package() {
    cd "${srcdir}/${_gitname}/build"
    make install
}

