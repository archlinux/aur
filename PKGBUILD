# Maintainer: FadeMind <fademind@gmail.com>

pkgname=kde-thumbnailer-mmap
pkgver=1.0
pkgrel=3
pkgdesc="KDE thumbnailer plugin for Mind Mapping File created by MindManager."
arch=('i686' 'x86_64')
license=('GPL')
url="http://kde-apps.org/content/show.php/KDE+Mind+Mapping+File+Thumbnailer?content=148746"
depends=('freemind' 'kdelibs')
makedepends=('automoc4' 'cmake')
source=("${pkgname}-${pkgver}.tar.bz2::http://kde-apps.org/CONTENT/content-files/148746-${pkgname}-${pkgver}.tar.bz2")
sha256sums=('7f2f807d381c1511c676bf900dcfbed630e9c484ee2655cb33f9c4f04e88ee0c')

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
