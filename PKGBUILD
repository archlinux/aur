# $Id$
# Maintainer: danitool

pkgname=('kde-l10n-es-legacy')
pkgver=4.14.3
pkgrel=1
pkgdesc=('Spanish Localization for KDE. Version before kf5')
arch=('any')
url='http://www.kde.org/'
license=('GPL')
makedepends=('cmake' 'automoc4' 'kdelibs')
conflicts=('kde-l10n-es')
options=('docs')
source=("http://download.kde.org/stable/${pkgver}/src/kde-l10n/kde-l10n-es-${pkgver}.tar.xz")
sha1sums=('ae5687ba63afb46e4b7855a9f5d77ab753b2e37b')

build() {
  cd ${srcdir}

    mkdir -p build/es
    cd build/es
    cmake ${srcdir}/kde-l10n-es-${pkgver} \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr
    make
    cd ../..
}

package() {
	cd ${srcdir}/build/es
	make DESTDIR=${pkgdir} install
}
