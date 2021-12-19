# Maintainer: Magnus Anderson <magnus@iastate.edu>

pkgname=foreign-language-text-reader-git
pkgdesc='FLTR: A java program to read text in different languages to learn those languages'
url='https://github.com/magnus-ISU/foreign-language-text-reader'
pkgver=1.4.0
pkgrel=1
license=('MIT')
arch=('x86_64')
depends=('jre-openjdk')
makedepends=()
source=("git+$url.git")
md5sums=('SKIP')

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/lib"
	mkdir -p "$pkgdir/usr/share/applications"
	mkdir -p "$pkgdir/usr/share/pixmaps"
	cd "$srcdir/${pkgname%-git}"
	INSTALL_FAKENAME="/usr" INSTALL_PREFIX="$pkgdir/usr" make install
}
