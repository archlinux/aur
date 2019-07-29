
# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=the-libs
pkgver=2.0
pkgrel=0
pkgdesc="Common libraries for the- applications by Victor Tran"
arch=("x86_64")
url="https://github.com/vicr123/the-libs"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'qt5-svg' 'qt5-x11extras' 'gsettings-qt')
makedepends=('git' 'qt5-tools')
source=("$pkgname-$pkgver"::"https://github.com/vicr123/the-libs/archive/v2.0.tar.gz")
sha256sums=('355ab18d8a88ec2ae37d091c4e885f50bf5267237c4348aa1712c16215d8ed35')

build() {
	cd "$pkgname-$pkgver"
	qmake
	make
}

package() {
	cd "$pkgname-$pkgver"
	make install INSTALL_ROOT=$pkgdir
}
