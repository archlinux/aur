# Maintainer: Cain Atkinson <yellowsink@protonmail.com>

_pkgname="pma"
pkgname="${_pkgname}-git"
pkgver=r93.18fb4bd
pkgrel=1
pkgdesc="Plugin MAnager for Vizality/Powercord."
arch=('x86_64')
url="https://kreatea.ml/pluginmanager/pma"
license=('GPL3')
groups=()
depends=('python' 'python-requests')
makedepends=()
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=("usr/share/${_pkgname}/data")
source=("${_pkgname}-source::git+${url}#branch=main")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}-source"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_pkgname}-source"
	make PREFIX="$pkgdir/usr" install
}
