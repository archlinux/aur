# Maintainer: aksr <aksr at t-com dot me>
pkgname=neatld-git
pkgver=r57.569a3c9
pkgrel=1
pkgdesc='A simple ARM/x86(_64) static linker.'
arch=('i686' 'x86_64')
url='http://repo.or.cz/w/ld.git'
license=('custom:BSD')
makedepends=('git')
optdepends=('neatcc-git: A simple ARM/x86(_64) C compiler'
	'neatas-git: A small ARM assembler'
	'neatlibc-git: A small ARM/x86(_64) libc')
source=("$pkgname::git+http://repo.or.cz/ld.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 nld $pkgdir/usr/bin/neatld
}
