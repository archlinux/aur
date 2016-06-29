# Maintainer: Jack Meredith <jackusm95@gmail.com>
pkgname=minisign
pkgver=0.6
pkgrel=1
epoch=
pkgdesc="Minisign is a dead simple tool to sign files and verify signatures."
arch=('x86_64')
url="https://jedisct1.github.io/minisign/"
license=(minisign/LICENSE)
depends=()
makedepends=(libsodium cmake)
source=(
	'git+https://github.com/jedisct1/minisign.git'
)
md5sums=('SKIP')

build() {
	mkdir -p minisign/build
	cd minisign/build
	cmake ..
	make
}

package() {
	cd minisign/build
	make DESTDIR="$pkgdir/" install
}
