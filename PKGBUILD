# Maintainer: BOEHM Guillaume <guillaumeboehm@hotmail.fr>
_projectname='meestic'
pkgname=meestic-git
pkgver=r10406.8d152463a
pkgrel=1
pkgdesc="Small command-line tool to control the keyboard lights of MSI Delta 15 laptops."
arch=('any')
url="https://github.com/Koromix/rygel"
license=('AGPL3')
depends=('libgudev')
makedepends=('git' 'base-devel')
provides=('meestic')
conflicts=('meestic')
replaces=('meestic')
source=("${_projectname}::git+${url}.git")
md5sums=('SKIP')

build() {
	cd "$srcdir/${_projectname}"
	./bootstrap.sh
	./felix -pFast meestic
}

package() {
	cd "$srcdir/${_projectname}"
	install -Dm755 ./bin/Fast/meestic "$pkgdir/usr/bin/meestic"
}
