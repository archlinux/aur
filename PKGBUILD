# Maintainer: liminggui <372884399@qq.com>
pkgname=vls
pkgver=0.21
pkgrel=1
epoch=
pkgdesc="slow list subdirectories and files and check file expire"
arch=('i686' 'x86_64')
url="github.com/keminar/vls"
license=('GPL')
groups=()
depends=()
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/keminar/${pkgname}.git#tag=v${pkgver}")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

prepare() {
	cd "$pkgname"
}

build() {
	cd "$pkgname"
	aclocal
	autoconf
	autoheader
	automake
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
