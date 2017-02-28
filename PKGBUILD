# Maintainer: emersion <contact@emersion.fr>

pkgname=ccdille-git
_pkgname=${pkgname%-git}
pkgver=v0.1.0.r1.db620b9
pkgrel=1
pkgdesc="A French precompiler"
arch=('any')
url="https://git.saucisseroyale.fr.cr/DiestVanMaitre_culain/ccdille"
license=('Unlicense')
groups=()
depends=()
makedepends=('git' 'make' 'gcc')
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
backup=()
options=()
install=
source=('git+https://git.saucisseroyale.fr.cr/DiestVanMaitre_culain/ccdille.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/$_pkgname"
	make bootstrap
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir/" install
}
