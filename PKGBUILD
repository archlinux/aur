# Maintainer: David Schury <dasc@posteo.de>

pkgname=otrtool-git
_pkgname=otrtool
pkgver=1.2.0.3.gd86b39e
pkgrel=1
pkgdesc="Open source decoder for .otrkey files (onlinetvrecorder.com)"
arch=('any')
url="https://github.com/otrtool/otrtool"
license=('custom:CC0')
depends=('curl' 'libmcrypt')
makedepends=('git')
conficts=('otrtool')
provides=('otrtool')
source=("git+https://github.com/$_pkgname/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --tags | sed -e 's|-|.|g' -e 's|^v||'
}

build() {
	cd "$_pkgname"
	make PREFIX=/usr
}

package() {
	cd "$_pkgname"
	make PREFIX=/usr DESTDIR=$pkgdir install
}

