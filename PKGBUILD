# Maintainer: Frank Siegert <frank.siegert@googlemail.com>
pkgname=fastjet
pkgver=3.2.0
pkgrel=1
pkgdesc="A particle physics package for jet finding in pp and e+e- collisions."
arch=('x86_64' 'i686')
url="http://fastjet.fr"
license=('GPL2')
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
source=(http://fastjet.fr/repo/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('3aa9d718ce409675c5c029bdfd6d61da')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr --enable-allplugins --enable-static=no
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
