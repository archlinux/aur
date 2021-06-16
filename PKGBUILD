# Maintainer: Sebastiaan de Schaetzen <sebastiaan.de.schaetzen(at)gmail.com>
pkgname=puncover-git
pkgver=r74.706dcc5
pkgrel=1
pkgdesc="Analyses C/C++ build output for code size, static variables, and stack usage"
arch=(any)
url="https://github.com/HBehrens/puncover"
license=('MIT')
groups=()
depends=(python-flask)
makedepends=('git')
provides=("puncover")
conflicts=("puncover")
replaces=()
backup=()
options=()
install=
source=('puncover::git+https://github.com/HBehrens/puncover.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/puncover"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/puncover"
	./setup.py install --prefix /usr --root $pkgdir
}
