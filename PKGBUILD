# Maintainer: Lin Ruoshui <echo bGluLnJ1b2hzaG9laUBnbWFpbC5jb20= | base64 -d>

pkgname=wavtool-pl
pkgver=0.20150501
pkgrel=1
epoch=
pkgdesc="drop-in replacement for wavtool inside UTAU"
arch=('any')
url="https://osdn.net/projects/wavtool-pl/"
license=('GPL3')
groups=()
depends=('libsndfile')
makedepends=()
checkdepends=()
optdepends=()
provides=('wavtool')
conflicts=('wavtool')
replaces=()
backup=()
options=()
install=
source=("$pkgname::git+https://scm.osdn.net/gitroot/wavtool-pl/wavtool-pl.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$pkgname"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
	autoreconf -fi
}

build() {
	cd "$pkgname"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname"
	make -k check
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}

