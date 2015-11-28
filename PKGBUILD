# Maintainer: Nick Østergaard <oe.nick at gmail dot com>
pkgname=buildgear
pkgver=0.9.25
pkgrel=1
pkgdesc="A lightweight embedded firmware build tool"
arch=('i686' 'x86_64')
url="http://buildgear.io/"
license=('GPLv2')
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('8420ab811870664fac25d4b648c2e0fe')

build() {
	cd "$pkgname-$pkgver"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
