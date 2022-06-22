# Maintainer: Yaroslav de la Peña Smirnov <yps@yaroslavps.com>

pkgname=revela
pkgver=0.1.1
pkgrel=1
pkgdesc="A static web image gallery generator."
arch=('any')
url="https://sr.ht/~yaroslav/revela/"
license=('GPL2')
makedepends=('gcc' 'make' 'scdoc' 'git' 'binutils')
depends=('graphicsmagick' 'libexif')
provides=('revela')
conflicts=('revela')
source=("$pkgname-$pkgver::git+https://git.sr.ht/~yaroslav/revela#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	git submodule update --init --recursive
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make PREFIX="$pkgdir/usr" install
}
