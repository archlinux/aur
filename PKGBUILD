# Maintainer: revel <revelΘmuub·net>
# Contributor: jwwolf <jwwolf+arch@gmail.com>

pkgname=onioncat
_ver=0.2.2
pkgver=0.2.2.r569
pkgrel=1
pkgdesc='An IP-Transparent Tor Hidden Service Connector'
arch=('i686' 'x86_64')
url='http://www.cypherpunk.at/onioncat/'
license=('GPL3')
depends=('tor')
source=("http://www.cypherpunk.at/ocat/download/Source/$_ver/$pkgname-$pkgver.tar.gz"{,.asc})
validpgpkeys=('B7604E9C4AE861F7C605B80C1DA87FC35C5FFD47') # Bernhard R. Fischer (_EaGLe_) <bf@abenteuerland.at>
md5sums=('9e38a26947e30594c91ea870d2aa2c65'
	'SKIP')
sha256sums=('377777de0d3c731fd2253db02b25562a2ed17e82901d0569308754215223f0bb'
	'SKIP')

build() {
	cd "$pkgname-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
