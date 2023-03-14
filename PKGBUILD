# Maintainer: maple3142 <kirby741852963@gmail.com>
pkgname=ecgen-git
pkgver=0.7.7.r0.gcfb85f1
pkgrel=1
pkgdesc="Tool for generating Elliptic curve domain parameters"
arch=('x86_64')
url="https://github.com/J08nY/ecgen"
license=('GPL')
depends=('pari')
makedepends=('git')
source=("ecgen::git+https://github.com/J08nY/ecgen")
md5sums=('SKIP')

prepare() {
	cd "$srcdir/ecgen"
	git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/ecgen"
	make
}

package() {
	cd "$srcdir/ecgen"
    install -Dm755 ecgen ${pkgdir}/usr/bin/ecgen
    install -Dm644 README.md -t ${pkgdir}/usr/share/doc/ecgen
}

