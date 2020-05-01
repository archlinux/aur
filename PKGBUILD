# -*- shell-script -*-
# Maintainer: Albert Graef <aggraef@gmail.com>

pkgname=pure-lilv
pkgver=0.5
pkgrel=2
pkgdesc="LV2 plugin host interface for Pure (lilv bindings)"
arch=("i686" "x86_64")
license=('BSD')
url="http://purelang.bitbucket.org/"
depends=('pure' 'lv2' 'lilv')
makedepends=()
groups=(pure-complete pure-multimedia)
source=("https://github.com/agraef/pure-lang/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('2cbb756c8dfaf7da8ab31102daa3b7b7')

build() {
	cd $srcdir/$pkgname-$pkgver
	make || return 1
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install || return 1
}
