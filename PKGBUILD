# Maintainer: Feresey <p.milko1999@yandex.ru>
pkgname=exo-player
arch=(x86_64)
pkgdesc="eXo music player based on moc, with QT5-based graphics"
pkgver=8.0
pkgrel=5
source=(git://github.com/Feresey/exo)
url=https://blaze.alwaysdata.net/exo
sha1sums=('SKIP')
license=(GPL)
install=${pkgname}.install
makedepends=(gcc cmake)
depends=(hicolor-icon-theme liblastfm-qt5 desktop-file-utils)
_gitname=exo

build() {
	cd "${srcdir}/${_gitname}"
    [[ ! -d build ]] && mkdir build
	cd build
    cmake .. -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"
    make
}

package() {
    cd "${srcdir}/${_gitname}/build"
    make install
}

