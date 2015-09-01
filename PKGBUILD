# Contributor: Nguyen Ha Duong <cmpitg@gmail.com>
# Contributor: Ngo Trung <ndtrung4419@gmail.com>
# Contributor: Dam Tien Long <longdt90@gmail.com>

pkgname="ibus-bogo"
pkgver=0.4
pkgrel=0
pkgdesc="Vietnamese input method for IBus with Bogo engine"

arch=('any')
url="https://github.com/BoGoEngine/ibus-bogo-python"
license=('GPL v3')
depends=('ibus' 'python' 'python-gobject' 'libwnck3' 'python-pyqt4' 'libnotify' 'qt4')
makedepends=('git' 'cmake' 'gcc' 'pyqt4-common')
source=("https://github.com/BoGoEngine/ibus-bogo-python/releases/download/v$pkgver.$pkgrel/ibus-bogo_$pkgver.$pkgrel.tar.gz")
sha1sums=("7aea0cf634c29b50a3229fac0f6aec402be863be")

build()  {
    cd ${srcdir}/${pkgname}

    mkdir -p build
    cd build

    cmake -DCMAKE_INSTALL_PREFIX:PATH="${pkgdir}/usr" ..
    make
}

package() {
    cd ${srcdir}/${pkgname}/build
    make install
}

