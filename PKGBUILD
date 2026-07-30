
# Maintainer: MatsyaOS <admin@matsyaos.ml>
pkgname=libmatsya
pkgver=1.1
pkgrel=1
pkgdesc="libmatsya of Matsya UI."
arch=('x86_64')
url="https://github.com/MatsyaOs/libmatsya"
license=('GPL')
groups=('Matsya')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'ninja')
depends=(
	'pkgconfig' 'pkgconf'
	'qt6-base' 'qt6-declarative' 'qt6-tools' 'qt6-sensors'
	'kf6-config' 'kf6-coreaddons' 'kf6-guiaddons' 'kf6-configwidgets'
	'kf6-kwindowsystem' 'kf6-kwayland' 'kf6-kdecoration'
	'kf6-networkmanager-qt' 'kf6-modemmanager-qt' 'kf6-bluez-qt'
	'kf6-screen' 'kf6-kio' 'libkscreen'
	'polkit' 'polkit-qt6'
	'accountsservice' 'kscreen'
	'freetype2' 'fontconfig'
	'xorg-server-devel' 'xf86-input-libinput' 'xf86-input-synaptics'
)
source=('git+https://github.com/MatsyaOs/libmatsya')
md5sums=('SKIP')

build() {
	cd "$srcdir"/libmatsya/
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd libmatsya
	DESTDIR="$pkgdir" make install
}
