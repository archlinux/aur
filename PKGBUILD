# Maintainer: jxir <aur@jxir.de>

pkgname=mucalc-git
pkgver=1.7.r2.g070412f
pkgrel=1
pkgdesc="Convenient calculator for the command line"
arch=('x86_64')
url="https://git.marlam.de/gitweb/?p=mucalc.git"
license=('GPL3')
depends=('muparser' 'readline')
makedepends=('git')
provides=('mucalc')
conflicts=('mucalc')
source=('git+https://git.marlam.de/git/mucalc.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/mucalc"
	git describe --long --tags | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/mucalc"
	make
}

package() {
	cd "$srcdir/mucalc"
  install -Dm755 mucalc "$pkgdir/usr/bin/mucalc"
}
