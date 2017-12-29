#Maintainer Mike Harris <mike.a.harris@outlook.com>
pkgname=plasma5-applets-kde-arch-update-notifier-git
pkgver=2.5.4
pkgrel=1
pkgdesc="A KDE plasmoid for your system tray notifying you of available updates"
url="https://github.com/I-Dream-in-Code/kde-arch-update-plasmoid"
arch=('any')
license=('GPL')
depends=("fakeroot" "konsole")
makedepends=("make" "cmake" "git" "extra-cmake-modules")
conflicts=()
replaces=()
backup=()
install=
source=("git+https://github.com/I-Dream-in-Code/kde-arch-update-plasmoid.git")
md5sums=("SKIP")
build() {
	cd kde-arch-update-plasmoid
	mkdir build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DLIB_INSTALL_DIR=lib -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
}
package(){
	cd ${srcdir}/kde-arch-update-plasmoid/build
	make DESTDIR="$pkgdir" install
	
}
