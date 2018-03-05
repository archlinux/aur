# Maintainer: Bert Peters <bert@bertptrs.nl>
pkgname=munin-template-munstrap-git
pkgver=r3632.c9157be3
pkgrel=1
pkgdesc="Bootstrap based template for munin-html"
arch=('any')
url="https://github.com/munin-monitoring/contrib/tree/master/templates/munstrap"
license=('GPL2')
makedepends=('git')
source=("${pkgname%-git}::git+https://github.com/munin-monitoring/contrib.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	local destdir="$pkgdir/usr/share/munin/templates/munstrap"
	cd "$srcdir/${pkgname%-git}"
	install -d "$destdir"
	cp -r templates/munstrap/{templates,static} "$destdir"
}
