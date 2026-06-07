# Maintainer: Daniil Mikhailov <danok123danok@gmail.com>
pkgname=ball-simulator-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple TTY simulator of a ball bouncing around"
arch=('x86_64')
url="https://github.com/fur-git/ball-simulator"
license=('Unlicense')
depends=()
makedepends=('gcc' 'git')
source=("git+https://github.com/fur-git/ball-simulator.git")
sha256sums=('SKIP')

build() {
	cd $srcdir/ball-simulator
	g++ ball_simulator.cpp -o ball_simulator
}

package() {
	cd $srcdir/ball-simulator
	mv ball_simulator ball-simulator
	mkdir -p $pkgdir/usr/bin/
	cp ball-simulator $pkgdir/usr/bin/
	chmod 755 $pkgdir/usr/bin/ball-simulator
}

