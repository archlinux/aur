# Maintainer: Roman Beslik <me@beroal.in.ua>
# Contributor: Boris Staletic <boris.staletic@gmail.com>
pkgname=diffpac-git
_pkgname=diffpac
pkgver=20140613
pkgrel=1
pkgdesc="Standalone replacement for pacdiffviewer"
arch=('any')
license=('GPL3')
makedepends=('git')
optdepends=('colordiff: colorized diff output')
provides=('diffpac')
conflicts=('diffpac')
source=('git://github.com/bruenig/diffpac.git')
md5sums=('SKIP')
pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
	cd "$srcdir/$_pkgname"
	install -D -m 755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
}
