# -*- shell-script -*-
# Maintainer: Albert Graef <aggraef@gmail.com>

pkgname=pure-lv2
pkgver=0.2
pkgrel=1
pkgdesc="LV2 plugin interface for Pure"
arch=("i686" "x86_64")
license=('BSD')
url="http://purelang.bitbucket.org/"
depends=('pure' 'lv2')
makedepends=()
groups=(pure-complete pure-multimedia)
source=("https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz")
md5sums=('10bbc147e00a01e2fa7548d00f958539')

build() {
	cd $srcdir/$pkgname-$pkgver
	make || return 1
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install || return 1
}
