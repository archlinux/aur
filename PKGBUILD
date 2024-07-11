# Maintainer: pitbuster <felipe.contreras.s@gmail.com>
pkgname=dolphin-rom-thumbnailer
pkgver=0.2.1
pkgrel=1
pkgdesc="KDE Dolphin Thumbnailer for video game ROMs"
arch=('x86_64')
url="https://codeberg.org/pitbuster/dolphin-rom-thumbnailer"
license=('GPL')
groups=()
depends=('glibc' 'gcc-libs' 'kcoreaddons' 'kio' 'qt6-base')
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
sha256sums=('e6f699fd410c3c18042a0e5311823e104a50de36f3e4a9e7f0fe9ea0c1c0129d')


build() {
	cmake -B build -S "$pkgname" -DKDE_INSTALL_USE_QT_SYS_PATHS=ON -Wno-dev
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
