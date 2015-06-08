# Maintainer: FadeMind <fademind@gmail.com>

pkgname=kde-thumbnailer-wmf
pkgver=2.1
pkgrel=2
pkgdesc="WMF thumbnailer plugin for KDE 4.x."
arch=('i686' 'x86_64')
license=('GPL')
url="http://kde-apps.org/content/show.php/KDE+WMF+Thumbnailer?content=141852"
depends=('libwmf' 'kdelibs')
makedepends=('automoc4' 'cmake')
source=("${pkgname}-${pkgver}.tar.bz2::http://kde-apps.org/CONTENT/content-files/141852-${pkgname}-${pkgver}.tar.bz2")
sha256sums=('4e31a8f09af66f75f43bdfb7927f229f24d214e67e5bfc210fab4dd0b75f6011')

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
