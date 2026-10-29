# Maintainer: Grafcube <grafcube at disroot dot org>

_pkgname=fake-home
pkgname=${_pkgname}-git
pkgver=v0.1.0.3.r2.gd1afa2b
pkgrel=1
pkgdesc="Banish your programs that don't respect XDG base directory"
arch=(any)
url="https://github.com/superluserdo/${_pkgname}"
license=('GPL-3.0-or-later')
depends=()
makedepends=()
provides=($_pkgname)
conflicts=($_pkgname)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${pkgname}"
	install -t "${pkgdir}/usr/bin/" -Dm755 fakehome fakehome-banish fakehome-changesymlinks
}
