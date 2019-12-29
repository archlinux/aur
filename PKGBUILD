# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Antony Jordan <antony.r.jorda at gmail dot com>
pkgname=deembed
pkgver=1.6
pkgrel=1
pkgdesc="TouchStone file viewer (smith, Db, phase, magnitude, VSWR, polar)."
arch=(x86_64)
url="https://github.com/fransschreuder/DeEmbed"
license=('GPL3')
depends=(qt5-svg)
makedepends=(qt5-base)
source=("$pkgname-$pkgver.tar.gz::https://github.com/fransschreuder/DeEmbed/archive/$pkgver.tar.gz")
md5sums=("07ef6bb67eb2318a6cdc1152a65cea79") 

prepare() {
	mkdir "DeEmbed-$pkgver/build"
	cd "DeEmbed-$pkgver/build"
	qmake ..
}

build() {
	cd "DeEmbed-$pkgver/build"
	make
}

package() {
	cd "DeEmbed-$pkgver/build"
	make INSTALL_ROOT="$pkgdir/" install
}

