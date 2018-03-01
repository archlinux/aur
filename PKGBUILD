# Maintainer: Gianluca Nitti <gianluca.nitti96@gmail.com>

_pkgname=mx3000control
pkgname=${_pkgname}-git
pkgver=r41.b39cbf2
pkgrel=1
pkgdesc="Unofficial configuration program for Perixx MX-3000 gaming mouse"
arch=('x86_64' 'i686')
url="https://github.com/gianluca-nitti/mx3000control"
license=('MIT')
groups=()
depends=('hidapi')
makedepends=('git' 'make' 'pkg-config')
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/gianluca-nitti/mx3000control.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_pkgname}"
	make
}

package() {
	cd "$srcdir/${_pkgname}"
	make PREFIX="$pkgdir/usr/" install
	install -Dm 664 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
