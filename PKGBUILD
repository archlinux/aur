# Maintainer: Szymon Scholz
# Contributor: FadeMind <fademind@gmail.com>

pkgname=kde-thumbnailer-fb2
pkgver=0.3.1
pkgrel=1
pkgdesc="A KDE thumbnail generator for the FictionBook (fb2) file format"
arch=('i686' 'x86_64')
license=('GPL')
url="http://kde-apps.org/content/show.php/KDE+fb2+Thumbnailer?content=160180"
depends=('ebook-tools' 'kdelibs')
makedepends=('automoc4' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Caig/${pkgname}/archive/v${pkgver}.tar.gz")

build() {
    install -d build/
    cd build/
    cmake ../${pkgname}-${pkgver}/ \
        -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) \
        -DCMAKE_BUILD_TYPE=Release \
        -DQT_QMAKE_EXECUTABLE=qmake-qt4
    make
}

package() {
    make -C build DESTDIR="${pkgdir}" install
}
md5sums=('6ea4944fc5b573c609aebe4347e4eb1e')
md5sums=('6ea4944fc5b573c609aebe4347e4eb1e')
