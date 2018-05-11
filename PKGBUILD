# Maintainer: Stefan Schmidt <thrimbor gmail com>

pkgname=srsgui-git
pkgver=20180511.4e85dbb
pkgrel=1
pkgdesc="srsGUI is a free and open-source graphics library for SDR using Qt and Qwt."
arch=('i686' 'x86_64')
url="https://github.com/suttonpd/srsgui.git"
license=('LGPL3')
depends=('qwt-qt4')
makedepends=(cmake git)
source=("git+https://github.com/srsLTE/srsGUI.git")
sha256sums=('SKIP')


build() {
    mkdir "${srcdir}"/srsGUI/build
    cd "${srcdir}"/srsGUI/build
    cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}"/usr ../
    make
}

package() {
    cd ${srcdir}/srsGUI/build
    make install
}
