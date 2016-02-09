# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Fabien Devaux <fdev31@gmail.com>
pkgname=volpack
pkgver=1.0c7
pkgrel=2
epoch=
pkgdesc="Enhanced Philippe Lacroute's volpack volume rendering library"
arch=('i686' 'x86_64')
url="http://amide.sourceforge.net/packages.html"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://sourceforge.net/projects/amide/files/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tgz/download")
noextract=()
md5sums=("119ec828ecad8dbf7afc4e71f4c4eb69")
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
