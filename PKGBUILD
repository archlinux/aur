# Maintainer: Pablo Arias <pabloariasal at gmail dot com>
pkgname=fontpreview-ueberzug-git
_pkgname=${pkgname%-git}
pkgver=r19.63e6b4c
pkgrel=1
pkgdesc="Preview system fonts in the terminal"
arch=('any')
url="https://github.com/OliverLew/fontpreview-ueberzug"
license=('MIT')
groups=()
depends=('fzf' 'imagemagick' 'ueberzug')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("git+${url}.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_pkgname}"
	install -D -m755 ${_pkgname} "$pkgdir/usr/bin/${_pkgname}"
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
