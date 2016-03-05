# Maintainer: zoe <chp321@gmail.com>

pkgname=kfoldersync
pkgver=3.1.2
pkgrel=1
pkgdesc="Folder synchronization and backup tool for KDE"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/KFolderSync?content=164092"
license=('GPLv2')
depends=('hicolor-icon-theme' 'kconfigwidgets' 'kcoreaddons' 'kdbusaddons' 'ki18n' 'kitemviews' 'kio' 'kwindowsystem' 'kxmlgui')
makedepends=('coreutils' 'extra-cmake-modules' 'gettext' 'phonon-qt5-gstreamer')
source=("http://kde-apps.org/CONTENT/content-files/164092-kfoldersync-${pkgver}.tar.xz" "${pkgname}.install")
install=${pkgname}.install
md5sums=('74ab8ed87c586bde9b5fd34b617d09e6' '262fc1597fb332894d1367f510a7f39b')

build()
{
cd ${srcdir}/${pkgname}-${pkgver}
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=`kf5-config --prefix` -DCMAKE_BUILD_TYPE=Release ..
make -j`nproc`
}

package()
{
cd "${srcdir}/${pkgname}-${pkgver}/build"
make  DESTDIR="${pkgdir}" install
}
