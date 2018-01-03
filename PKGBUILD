#Maintainer Mike Harris <mike.a.harris@outlook.com>
pkgname=plasma5-applets-kde-arch-update-notifier-git
pkgver=3.0.2
pkgrel=1
pkgdesc="A KDE plasmoid for your system tray notifying you of available updates with AUR Support"
url="https://github.com/I-Dream-in-Code/kde-arch-update-plasmoid"
arch=('x86_64')
license=('GPL')
depends=("fakeroot" "konsole")
optdepends=("checkupdates-aur")
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
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DKDE_INSTALL_LIBDIR=lib -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
}
package(){
	cd ${srcdir}/kde-arch-update-plasmoid/build
	make DESTDIR="$pkgdir" install
	
}
