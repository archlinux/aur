# Maintainer: katt <magunasu.b97@gmail.com>
# Contributor: Mitchell Renouf <mitchellarenouf@gmail.com>

pkgname=libopenaptx-git
pkgver=0.2.0.r1.g99b0921
pkgrel=1
pkgdesc='Open Source implementation of Audio Processing Technology codec (aptX)'
arch=(x86_64)
url='https://github.com/pali/libopenaptx'
license=(LGPL2.1)
depends=(glibc)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+"${url}".git)
sha512sums=(SKIP)

pkgver() {
	cd "${pkgname%-git}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname%-git}"
	make
}

package() {
	cd "${pkgname%-git}"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}
