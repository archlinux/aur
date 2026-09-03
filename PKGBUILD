# Maintainer: aksr <aksr88 at gmail dot com>
pkgname=fbvis-git
pkgver=r21.58caabc
pkgrel=3
pkgdesc='A small framebuffer image viewer, it does not use external libraries.'
arch=('i686' 'x86_64')
url='http://dev.rudi.ir/'
license=('custom:BSD')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("$pkgname::git+git://repo.or.cz/fbvis.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	make all
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 fbvis $pkgdir/usr/bin/fbvis
	install -D -m644 README $pkgdir/usr/share/doc/$pkgname/README
}
