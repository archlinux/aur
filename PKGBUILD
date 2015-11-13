# Maintainer: Gustavo Chain <gchain[at]gmail[dot]com>

pkgname=kjell
pkgver=git
pkgrel=1
pkgdesc='a refurbished Erlang shell with support for color profiles and extensions.'
url='https://github.com/karlll/kjell'
licence=('EPL')
arch=('x86_64')
depends=('erlang' 'make')
makedepends=('git')
provides=('kjell')
source=(git+https://github.com/karlll/kjell)
md5sums=('SKIP')

build() {
	cd "$srcdir/kjell"
	make
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cd "$srcdir/kjell"
	make BIN_DIR="$pkgdir/usr/bin" INSTALL_DIR="$pkgdir/opt/kjell" install
}
