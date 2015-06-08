# Maintainer: FadeMind <fademind@gmail.com>

pkgname=kde-thumbnailer-plasmoid
pkgver=1.1
pkgrel=2
pkgdesc="Preview image generator plugin for plasma plasmoid package."
arch=('i686' 'x86_64')
license=('GPL')
url="http://kde-apps.org/content/show.php/KDE+Plasmoid+Thumbnailer?content=146527"
depends=('kdelibs')
makedepends=('automoc4' 'cmake')
source=("${pkgname}-${pkgver}.tar.bz2::http://kde-apps.org/CONTENT/content-files/146527-${pkgname}-${pkgver}.tar.bz2")
sha256sums=('1c49ed288c22811abb30ac6a616c8473b7e9f6dae70d9cb519f58bde95a9fbaf')

build() {
    install -d build/
    cd build/
    cmake ../${pkgname}/ \
        -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) \
        -DCMAKE_BUILD_TYPE=Release \
        -DQT_QMAKE_EXECUTABLE=qmake-qt4
    make
}

package() {
    make -C build DESTDIR="${pkgdir}" install
}
