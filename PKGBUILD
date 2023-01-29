# Maintainer: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: Cosku Bas <cosku.bas@gmail.com>

pkgname=quetoo-data-git
pkgver=r671.92f743e
pkgrel=1
pkgdesc="Quetoo is a Free first person shooter for Mac, PC and Linux."
arch=('any')
url="http://quetoo.org"
license=('GPL2')
makedepends=('git')
source=(git+https://github.com/jdolan/quetoo-data)
sha1sums=('SKIP')

pkgver() {
	cd quetoo-data
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd quetoo-data
	mkdir -p "$pkgdir/usr/share/quetoo"
	cp -r target/default $pkgdir/usr/share/quetoo/default
}
