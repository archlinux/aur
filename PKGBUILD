# Maintainer: zoe <chp321@gmail.com>

pkgname=kfoldersync
_pkgname=KFolderSync
pkgver=3.4.1
pkgrel=2
pkgdesc="Folder synchronization and backup tool for KDE"
arch=('i686' 'x86_64')
url="https://www.linux-apps.com/content/show.php/${_pkgname}?content=164092"
license=('GPLv2')
depends=('plasma-workspace' 'hicolor-icon-theme' 'kconfigwidgets' 'kdbusaddons' 'kitemviews' 'kwindowsystem' 'kxmlgui')
makedepends=('extra-cmake-modules' 'phonon-qt5-gstreamer')
source=("https://dl.opendesktop.org/api/files/downloadfile/id/1485353737/s/51d7af8830c796966b7108ee1d2cc015/t/1517134907/u//${pkgname}-${pkgver}.tar.xz"
        "${pkgname}.install")
install=${pkgname}.install
md5sums=('33e049d7065cb27382eb7bcb6432b41b' '262fc1597fb332894d1367f510a7f39b')

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
