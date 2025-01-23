# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=fortran-language-server
pkgver=1.12.0
pkgrel=4
pkgdesc="Fortran Language Server for the Language Server Protocol"
arch=(any)
url="https://github.com/hansec/fortran-language-server"
license=('MIT')
depends=(python-setuptools)
makedepends=(python-build python-installer python-wheel)
source=("https://github.com/hansec/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('5cda6341b1d2365cce3d80ba40043346c5dcbd0b35f636bfa57cb34df789ff17')

prepare() {
	COLOR_RED='\033[0;31m'
	COLOR_NONE='\033[0m'
	echo -e "${COLOR_RED}fortran-language-server is not maintained anymore. Consider switching to fortls.${COLOR_NONE}"
}

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl

	# License
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
