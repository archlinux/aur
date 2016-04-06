pkgname=psi-plus-resources-qt5-git
pkgver=20160401
pkgrel=1
pkgdesc="Additional iconsets, themes and sounds for Psi+ (Qt5 build)"
arch=('any')
url="http://psi-plus.com"
license=('GPL2')
depends=('psi-plus-qt5-git')
provides=("psi-plus-resources-git=$pkgver")
conflicts=("psi-plus-resources-git=$pkgver")
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
	# Next files are alreay present in psi base package
	rm -rf "$pkgdir"/usr/share/psi-plus/sound
	rm -rf "$pkgdir"/usr/share/psi-plus/themes/chatview
}
