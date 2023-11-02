# Maintainer: Wyatt Kinard wyattkinard@skiff.com
#
#Atention:
#I did not create crumb, nor do I maintain it (not a lot anyways), but I maintain the aur package
#
#
pkgname=crumb
pkgver=0.0.2
pkgrel=1
pkgdesc="Crumb is a high level, functional, interpreted, dynamically typed, general-purpose programming language, with a terse syntax, and a verbose standard library."
arch=('x86_64')
url="https://github.com/liam-ilan/crumb/tree/main/src"
license=('GPL')
makedepends=('gcc'
'coreutils')
source=('crumb::git+https://github.com/liam-ilan/crumb.git')
md5sums=('SKIP')
prepare() {
	cd "$srcdir"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd crumb/src
	gcc *.c -Wall -lm -o crumb
}

package() {
	cd crumb/src
	mv crumb $pkgdir/usr/bin
}


