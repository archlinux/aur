# Maintainer: Tony Morello <tony@morellowebdesign.com>
pkgname=trash
pkgver=1.5
pkgrel=1
epoch=
pkgdesc="A CLI trash can (recycle bin)"
arch=('i686' 'x86_64')
url="https://github.com/tonymorello/trash"
license=('GPL')
groups=()
depends=()
makedepends=(shc)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=(SKIP)
validpgpkeys=()

build() {
	cd "${srcdir}/$pkgname-$pkgver"
	make
}

package() {
	cd "${srcdir}/$pkgname-$pkgver"
	rm makefile trash.sh trash.sh.x.c
	install -Dm755 "${srcdir}/$pkgname-$pkgver"/trash "${pkgdir}"/usr/bin/trash
}
