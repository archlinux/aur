# Maintainer: Michael Valera <arianon@openmailbox.org>
_pkgname=xrq
pkgname=${_pkgname}-git
pkgver=8
pkgrel=1
pkgdesc="Queries the X Resource Database"
arch=('i686' 'x86_64')
url="https://github.com/arianon/${_pkgname}"
license=('ISC')
depends=('libx11')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/arianon/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git rev-list --count HEAD
}

build() {
	cd "$srcdir/$_pkgname"
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
