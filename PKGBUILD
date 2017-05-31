# Maintainer: Alexey D. <lq07829icatm@rambler.ru>

pkgname=psi-plus-resources-git
pkgver=v17.05.29
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

	git describe --tags | cut -d - -f 1-2 --output-delimiter=.
}

package() {
	cd psi-plus-resources

	install -v -dm755 "$pkgdir/usr/share/psi-plus/"
	cp -rv * "$pkgdir/usr/share/psi-plus/"
}
