# Maintainer: aksr <aksr at t-com dot me>
pkgname=ctxt-git
pkgver=0.r97.fdfa0cc
pkgrel=2
pkgdesc="A simple markup processor around html, troff, and latex, converts plain text to other formats."
arch=('i686' 'x86_64')
url="https://litcave.rudi.ir/"
license=('custom:BSD')
makedepends=('git')
source=("$pkgname::git+https://repo.or.cz/ctxt.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	make all
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 ctxt $pkgdir/usr/bin/ctxt
	install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
}
