# Maintainer: Alastair Pharo <asppsa at gmail dot com>

pkgname=pure-glpk
pkgver=0.6
pkgrel=1
pkgdesc="A feature complete GLPK interface for the Pure programming language."
arch=("i686" "x86_64")
license=('GPL3')
url="https://agraef.github.io/pure-lang/"
depends=('pure' 'glpk')
makedepends=('unixodbc')
groups=(pure-complete pure-math)
source=("https://github.com/agraef/pure-lang/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha1sums=('97c66826d98641f84a53e5aa8a148ed5e443face')

build() {
	cd $srcdir/$pkgname-$pkgver
	make || return 1
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install || return 1
}
