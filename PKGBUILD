# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Nathan Kessler <nathant93 <at> gmail.com>
pkgname=scheme48
pkgver=1.9.2
pkgrel=1
epoch=0
pkgdesc="Scheme interpreter for experimentation"
arch=('i686' 'x86_64')
url="http://s48.org/"
license=('custom')
groups=()
depends=()
makedepends=(sh)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://s48.org/${pkgver}/scheme48-${pkgver}.tgz")
noextract=()
md5sums=('7a869c794ca7f67ea69e98a4f2fbd7b2')
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
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
