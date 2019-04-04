# Maintainer: Frank Asseg <frank.asseg@objecthunter.net>
_commit=2ac7a909e66cff019acaa0566be721e3696f0bce
pkgname=crumbs
pkgver=0.0.2
pkgrel=3
epoch=
pkgdesc="A bookmarking system for the command line"
arch=('any')
url="https://github.com/fasseg/crumbs"
license=('WTFPL')
groups=()
depends=()
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=('etc/crumbs.conf')
options=()
install=
changelog=
source=("git://github.com/fasseg/crumbs.git#commit=${_commit}")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd "$pkgname"
    automake --add-missing
	./configure --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
