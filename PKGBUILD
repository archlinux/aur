# Maintainer: Nick Østergaard <oe.nick at gmail dot com>
pkgname=buildgear
pkgver=0.9.26
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
md5sums=('c5d222e056c3f46d12b147804a48d190')

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
