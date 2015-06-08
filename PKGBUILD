# Maintainer: FadeMind <fademind@gmail.com>

pkgname=kde-thumbnailer-qml
pkgver=1.0
pkgrel=2
pkgdesc="QML(Qt Markup Language File) thumbnailer plugin for KDE 4.x."
arch=('i686' 'x86_64')
license=('GPL')
url="http://kde-apps.org/content/show.php/KDE+QML+Thumbnailer?content=148662"
depends=('kdelibs')
makedepends=('automoc4' 'cmake' 'kdelibs')
source=("${pkgname}-${pkgver}.tar.bz2::http://kde-apps.org/CONTENT/content-files/148662-${pkgname}-${pkgver}.tar.bz2")
sha256sums=('4a16152be74479817f878f5d22fd8dce69a62a2694dbb729a2141e2df26ab78b')

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
