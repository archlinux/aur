# Maintainer: zoe <chp321@gmail.com>

pkgname=kfoldersync
_pkgname=KFolderSync
pkgver=3.4.0
pkgrel=1
pkgdesc="Folder synchronization and backup tool for KDE"
arch=('i686' 'x86_64')
url="https://www.linux-apps.com/content/show.php/${_pkgname}?content=164092"
license=('GPLv2')
depends=('plasma-workspace' 'hicolor-icon-theme' 'kconfigwidgets' 'kdbusaddons' 'kitemviews' 'kwindowsystem' 'kxmlgui')
makedepends=('coreutils' 'extra-cmake-modules' 'gettext' 'phonon-qt5-gstreamer')
source=("https://dl.opendesktop.org/api/files/download/id/1482526406/${pkgname}-${pkgver}.tar.xz"
        "${pkgname}.install")
install=${pkgname}.install
md5sums=('bd56a9da1506d25badc307beec5181c7' '262fc1597fb332894d1367f510a7f39b')

build()
{
cd ${srcdir}/${pkgname}-${pkgver}
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=`qtpaths --install-prefix` -DCMAKE_BUILD_TYPE=Release ..
make -j`nproc`
}

package()
{
cd "${srcdir}/${pkgname}-${pkgver}/build"
make  DESTDIR="${pkgdir}" install
}
