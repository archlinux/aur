# Maintainer: Matt C <matt@xhec.us>
pkgname=aurtoo-git
_pkgname=aurtoo
pkgver=1.0
pkgrel=1
pkgdesc="Tool to manage your local AUR repo"
arch=('any')
url="https://github.com/SomethingGeneric/aurtoo"
license=('custom:nolicense')
depends=('pacman-contrib')
provides=('aurtoo')

source=("${_pkgname}::git+https://github.com/SomethingGeneric/aurtoo.git")

md4sums=("SKIP")

package() {
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/licenses/$_pkgname
	cd $_pkgname
	make
	cp aurtoo $pkgdir/usr/bin/aurtoo
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
md5sums=('SKIP')
