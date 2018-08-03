# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Alexey D. <lq07829icatm@rambler.ru>

pkgname=psi-plus-resources-git
pkgver=18.02.05.2.gc0bfb8a
pkgrel=1
pkgdesc="Additional iconsets, themes and sounds for Psi+ (Qt5 build)"
arch=('any')
url="https://psi-plus.com"
license=('GPL2')
depends=('psi-plus-git')
makedepends=('git')
provides=("psi-plus-resources=$pkgver" "psi-plus-resources-qt5=$pkgver")
conflicts=("psi-plus-resources" "psi-plus-resources-qt5-git")
options=('!strip' '!zipman')
source=('psi-plus-resources::git://github.com/psi-plus/resources.git')
md5sums=('SKIP')

pkgver() {
	cd psi-plus-resources

	git describe --long --tags | sed 's/^v//;s/-/./g'
}

package() {
	cd psi-plus-resources
	install -v -dm755 "$pkgdir/usr/share/psi-plus/"
	cp -rv * "$pkgdir/usr/share/psi-plus/"
	# Next files are alreay present in psi base package
	rm -rf "$pkgdir"/usr/share/psi-plus/sound
	rm -rf "$pkgdir"/usr/share/psi-plus/themes/chatview
}
