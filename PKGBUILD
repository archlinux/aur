# Maintainer: pitbuster <felipe.contreras.s@gmail.com>
pkgname=dolphin-rom-thumbnailer
pkgver=0.1.7
pkgrel=1
pkgdesc="KDE Dolphin Thumbnailer for video game ROMs"
arch=('x86_64')
url="https://codeberg.org/pitbuster/dolphin-rom-thumbnailer"
license=('GPL')
groups=()
depends=('glibc' 'gcc-libs' 'kcoreaddons5' 'kio5' 'qt5-base')
makedepends=('extra-cmake-modules' 'corrosion')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/pitbuster/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('4096f651837c3f308356b63a0e3ccffd22830039cb6775f86a9b42608edb21da')


build() {
	cmake -B build -S "$pkgname" -DKDE_INSTALL_USE_QT_SYS_PATHS=ON -Wno-dev
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
