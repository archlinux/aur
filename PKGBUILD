# Maintainer: Christian <0x2a@posteo.org>
pkgname=labpowerqt
pkgver=0.1.2
pkgrel=1
epoch=
pkgdesc="LabPowerQt is a GUI application written in C++/Qt to control lab power supplies"
arch=('i686' 'x86_64')
url="https://github.com/crapp/labpowerqt"
license=('GPL')
groups=()
depends=('gcc' 'qt5-base' 'qt5-serialport' 'ealogger>=0.8.1')
makedepends=('cmake>=3.1')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/crapp/$pkgname/archive/v$pkgver.tar.gz")
noextract=()
md5sums=('06856d5aa0b196967289148106d86516')
validpgpkeys=()

prepare() {
  ls -al
	cd "$pkgname-$pkgver"
  mkdir build
}

build() {
	cd "$pkgname-$pkgver/build"
	cmake -DCMAKE_BUILD_TYPE=Release -DEALOGGER_EXTERNAL=OFF -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" ../
	make
}

check() {
	cd "$pkgname-$pkgver/build"
}

package() {
	cd "$pkgname-$pkgver/build"
	make install
}
