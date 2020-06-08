
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=the-libs
pkgver=2.2
pkgrel=0
pkgdesc="Common libraries for the- applications by Victor Tran"
arch=("x86_64")
url="https://github.com/vicr123/the-libs"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'qt5-svg' 'qt5-x11extras' 'gsettings-qt')
makedepends=('git' 'qt5-tools')
source=("$pkgname-$pkgver"::"https://github.com/vicr123/the-libs/archive/v2.2.tar.gz")
sha256sums=('ea24a40adb8e5dcf63335ed4ffa273deb240df232ef06d6da8951a3683489caa')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install INSTALL_ROOT=$pkgdir
}
