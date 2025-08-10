# Maintainer: birbkeks  birbkeks@proton.me

pkgname=aero-theme-plasma
pkgver=6.3.4
pkgrel=1
pkgdesc="A KDE Plasma modification that aims to replicate the look and feel of Windows 7."
arch=('x86_64')
url="https://gitgud.io/wackyideas/aerothemeplasma"
license=('GNU AGPLv3')
depends=('git' 'cmake' 'extra-cmake-modules' 'ninja' 'qt6-virtualkeyboard' 'qt6-multimedia' 'qt6-5compat' 'plasma-wayland-protocols' 'plasma5support' 'kvantum' 'base-devel' 'plasma-x11-session' 'kwin-x11')
provides=('aero-theme-plasma')
options=(!debug)
source=("https://gitgud.io/wackyideas/aerothemeplasma/-/archive/master/aerothemeplasma-master.tar")
md5sums=('SKIP')

package() {
	cd "${srcdir}/aerothemeplasma-master"

	chmod +x compile.sh && ./compile.sh --ninja --wayland

	chmod +x install_plasmoids.sh && ./install_plasmoids.sh --ninja

	chmod +x install_plasma_components.sh && ./install_plasma_components.sh

	chmod +x install_kwin_components.sh && ./install_kwin_components.sh

	chmod +x install_misc_components.sh && ./install_misc_components.sh
}
