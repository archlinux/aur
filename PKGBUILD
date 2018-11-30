# Maintainer: Alessio Fachechi <mail@alezz.io>

pkgname=hamster-sidejack
pkgver=2.0
pkgrel=1
pkgdesc="A sidejacking proxy server"
arch=('x86_64' 'x64')
url="http://pkg.kali.org/pkg/hamster-sidejack"
license=('GPL')
source=('git://git.kali.org/packages/hamster-sidejack.git')
md5sums=('SKIP')
makedepends=('git')
prepare() {
	cd "$srcdir/$pkgname"
	git checkout upstream/2.0
	mkdir tmp
}

build() {
	cd "$pkgname/build/gcc4"
	make
}

package() {
	cd "$pkgname"
	install -D bin/hamster $pkgdir/usr/bin/$pkgname
}
