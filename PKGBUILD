# Maintainer: Matt C <matt@xhec.us>
pkgname=aurtomatic-git
_pkgname=aurtomatic
pkgver=2.0
pkgrel=1
pkgdesc="Tool to manage your local AUR repo"
arch=('any')
url="https://github.com/SomethingGeneric/aurtomatic"
license=('custom:nolicense')
depends=('python')
provides=('aurtomatic')
conflicts=('python3-aur')

source=("${_pkgname}::git+https://github.com/SomethingGeneric/aurtomatic.git")

md4sums=("SKIP")

package() {
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/licenses/$_pkgname
	cd $_pkgname
	make
	cp aurtomatic $pkgdir/usr/bin/aurtomatic
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
md5sums=('SKIP')
