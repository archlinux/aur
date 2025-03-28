# Maintainer: Oliver Tzeng（曾嘉禾）<olivertzeng at proton dot me>

pkgname=sours-full-color-icon-theme-git
pkgver=5.3.1.r196.gc82d485
pkgrel=2
pkgdesc="Sours is an icon theme for Linux with tasty gradients, rounded lines, and color coordination"
arch=(any)
url=https://github.com/tully-t/Sours
license=(GPL3)
depends=('gtk-update-icon-cache')
makedepends=('git')
options=(!strip !emptydirs)
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$pkgname/Sours-Full-Color"
	# remove cache as it will be generated again
	rm icon-theme.cache
	install -d "$pkgdir/usr/share/icons"
	cp -r ./ "$pkgdir/usr/share/icons/Sours-Full-Color"
}
