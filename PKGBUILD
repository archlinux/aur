# Maintainer: Camille <onodera@rizon>
pkgname=wmutils-git
pkgver=1.0.r23.g1be37b6
pkgrel=1
pkgdesc="A set of tools for X windows manipulation."
url="https://github.com/wmutils/core"
arch=('i686' 'x86_64')
license=('ISC')
depends=('libxcb')
source=("$pkgname::git+https://github.com/wmutils/core.git")
sha1sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^v//g'
}
build() {
	cd "$srcdir/$pkgname"
  make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" PREFIX="/usr/local" install
}

