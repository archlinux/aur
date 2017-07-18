# Maintainer: Yurii Kolesnykov <yurikoles@gmail.com>
pkgname=dps8m
pkgver=1.0
pkgrel=1
pkgdesc='Simulator for the Multics dps-8/m mainframe'
arch=('x86_64')
url='http://ringzero.wikidot.com'
license=('ICU')
makedepends=('clang')
source=("https://sourceforge.net/projects/$pkgname/files/Release%20$pkgver/source.tgz")
sha256sums=('51088dd91de888b918644c431eec22318640d28eb3050d9c01cd072aa7cca3c7')
validpgpkeys=()

build() {
	cd "$pkgname-code"
	make
}

package() {
	cd "$pkgname-code"
	install -d 755 "$pkgdir/usr/bin"
	make INSTALL_ROOT="$pkgdir/usr" install
}
