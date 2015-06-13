# -*- shell-script -*-
# Maintainer: Albert Graef <aggraef@gmail.com>

pkgname=pure-lilv
pkgver=0.4
pkgrel=1
pkgdesc="LV2 plugin host interface for Pure (lilv bindings)"
arch=("i686" "x86_64")
license=('BSD')
url="http://purelang.bitbucket.org/"
depends=('pure' 'lilv')
makedepends=()
groups=(pure-complete pure-multimedia)
source=("https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz")
md5sums=('6213cdf3add09fc5b2fd349adf5d541f')

build() {
	cd $srcdir/$pkgname-$pkgver
	make || return 1
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install || return 1
}
