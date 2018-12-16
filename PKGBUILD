# Maintainer: Robert Conde <elconde at alum dot mit dot edu>
pkgname=mbox2eml
pkgver=0.1.2
pkgrel=1
epoch=
pkgdesc="Splits mbox mailboxes into single eml files"
arch=('x86_64')
url="https://sourceforge.net/projects/mbox2eml/"
license=('GPL2')
groups=()
depends=('boost' 'popt')
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
source=("https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-0.1.2.tar.gz")
noextract=()
md5sums=('3aeed01e7f3db0173b9a5b7d44897691')
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
