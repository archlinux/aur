# Maintainer: Ulises Jeremias Cornejo Fandos <ulisescf.24@gmail.com>
# Maintainer: Federico Ramon Gasquez <federicogasquez@gmail.com>
# Maintainer: Maria Macarena Lindo Poisson <maquipoisson@gmail.com>

pkgname=dots-git
pkgver=1.2.0
pkgrel=1
pkgdesc="Dotfiles generator that allows quick configuration and managing of different tools and window managers in multiple OSs"
arch=(any)
url="https://github.com/ulises-jeremias/dotfiles"
license=('MIT')
depends=(git)
optdepends=()
provides=(dots)
conflicts=(dots)
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd dotfiles || exit 1
	git fetch --tags
	git describe --tags "$(git rev-list --tags --max-count=1)" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd dotfiles || exit 1
	PKGNAME=dots
	DESTDIR="${pkgdir}"
	export DESTDIR PKGNAME
	./install
}
