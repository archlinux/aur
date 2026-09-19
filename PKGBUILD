# Maintainer: cyber-luna <cyber-luna@tuta.io>

pkgname='lunas'
pkgver=3.0
pkgrel=1
pkgdesc="A syncing cli tool that can handle more than two directories locally and remotely"
arch=('any')
url="https://github.com/nodeluna/lunas"
license=('GPL3')
depends=('libssh')
makedepends=('git' 'gcc' 'xmake')
source=("git+https://github.com/nodeluna/lunas")
sha256sums=('SKIP')

build(){
	cd "$srcdir/$pkgname"
	git submodule update --init --remote --recursive
	xmake f -m release
	xmake -P .
}

package(){
	cd "$srcdir/$pkgname"
	xmake install -o "$pkgdir/usr" --root
}
