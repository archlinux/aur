# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: wostarxi <wostarxi@outlook.com>

pkgname=ranger_devicons-git
_pkg="${pkgname%-git}"
pkgver=r87.5bb1c32
pkgrel=1
pkgdesc='Ranger plugin that adds file glyphs/icon support to Ranger'
arch=('any')
url='https://github.com/alexanderjeurissen/ranger_devicons'
license=('GPL3')
depends=('ranger' 'nerd-fonts')
makedepends=('git')
provides=("$_pkg")
conflicts=("$_pkg")
install="$_pkg.install"
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	install -Dv __init__.py devicons.py -t "$pkgdir/usr/share/ranger/plugins/$_pkg/"
}
