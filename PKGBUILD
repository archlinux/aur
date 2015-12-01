# Maintainer: Adrian Sinclair <adrian at adrusi dot com>

_pkgname=terra
pkgname=$_pkgname-git
pkgver=ac615b0
pkgrel=1
pkgdesc="Low-level system programming language that is designed to interoperate seamlessly with the Lua programming language."
url="http://terralang.org/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('clang35' 'llvm35')
makedepends=('git' 'wget')
source=(git://github.com/zdevito/terra)
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git log | head -n 1 | cut -c8-14
}

build() {
	cd "$srcdir/$_pkgname"
	make
}

package() {
	cd "$srcdir/$_pkgname"
	cp -r release "$pkgdir/usr"
}
