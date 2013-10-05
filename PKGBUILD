# Maintainer: lantw44 (at) gmail (dot) com

pkgname=qelly-git
pkgver=1.0a.9.g2d54801
pkgrel=1
pkgdesc="Qelly is a Qt port of Nally"
arch=('x86_64' 'i686')
url="https://github.com/uranusjr/Qelly"
license=('GPL')
depends=('qt4' 'libqxt')
makedepends=()
conflicts=('qelly')
provides=('qelly')
source=("$pkgname::git+https://github.com/uranusjr/Qelly.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	local ver="$(git describe --long)"
	ver="${ver#v}"
	ver="${ver//-/.}"
	printf "%s" "$ver"
}

build() {
	cd "$pkgname"
	qmake-qt4
	make
}

package() {
	cd "$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	install -m 755 "bin/Qelly" "$pkgdir/usr/bin"
}
