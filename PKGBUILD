# Maintainer: dax <dev@dax.moe>
pkgname=solvitaire-git
pkgver=r125.680da21
pkgrel=1
pkgdesc="solitaire, klondlike, & spider in the terminal"
arch=('x86_64')
url="https://gir.st/sol.htm"
license=('GPL')
depends=()
makedepends=('git')
provides=("solvitaire")
conflicts=("solvitaire")
source=('git+https://github.com/girst/solvitaire')
md5sums=('SKIP')

pkgver() {
	cd solvitaire
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd solvitaire
	make
}

package() {
	cd solvitaire
	install -D sol "$pkgdir"/usr/bin/sol
	install -D spider "$pkgdir"/usr/bin/spider
	install -D freecell "$pkgdir"/usr/bin/freecell
	install -D -m 0644 LICENSE "$pkgdir"/usr/share/licenses/solvitaire/LICENSE
	install -D -m 0644 README.md "$pkgdir"/usr/share/doc/solvitaire/README.md
}
