# Maintainer: Stephen Zhang <zsrkmyn at gmail dot com>

_pkgname=lua-signal
pkgname=lua51-signal
pkgver=1.2.1
pkgrel=1
pkgdesc='Lua support for ANSI C signals'
arch=('i686' 'x86_64')
url='https://github.com/batrick/lua-signal'
license=('MIT')
depends=(lua51)
source=("https://github.com/batrick/lua-signal/archive/${pkgver}.tar.gz")
md5sums=('e6c2d893a0d2d487f809f04769797e04')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	sed -i -e '37s#<#<lua5.1/#' lsignal.c
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -dm755 "$pkgdir/usr/lib/lua/5.1/"
	DESTINATION="$pkgdir/usr/lib/lua/5.1/" \
	make install
}

