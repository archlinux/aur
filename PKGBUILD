# Maintainer: Alexey D. <lq07829icatm@rambler.ru>

pkgname=psi-plus-resources-git
pkgver=20140502
pkgrel=1
pkgdesc="Additional iconsets, themes and sounds for Psi+"
arch=('any')
url="http://psi-plus.com"
license=('GPL2')
depends=('psi-plus-git')
options=('!strip' '!zipman')
source=('psi-plus-resources::git://github.com/psi-plus/resources.git')
md5sums=('SKIP')

pkgver() {
	cd psi-plus-resources

	# Date of last commit
	git log -1 --format="%ci" HEAD | cut -d\  -f1 | tr -d '-'
}

package() {
	cd psi-plus-resources

	install -v -dm755 "$pkgdir/usr/share/psi-plus/"
	cp -rv * "$pkgdir/usr/share/psi-plus/"
}
