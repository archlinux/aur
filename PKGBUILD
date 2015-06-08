# Maintainer: FadeMind <fademind@gmail.com>

pkgname=kde-thumbnailer-fb2
pkgver=0.2
pkgrel=2
pkgdesc="A KDE thumbnail generator for the FictionBook (fb2) file format"
arch=('i686' 'x86_64')
license=('GPL')
url="http://kde-apps.org/content/show.php/KDE+fb2+Thumbnailer?content=160180"
depends=('ebook-tools' 'kdelibs')
makedepends=('automoc4' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::http://kde-apps.org/CONTENT/content-files/160180-${pkgname}-${pkgver}.tar.gz")
sha256sums=('7cf6cce6a5ebf92eced5118a82765b620d9962b4686918c921571e1f773455d6')

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
