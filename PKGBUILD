# Maintainer: Konstantinos Patsourakos <konpatsourakos@gmail.com>
pkgname=python-cpmpy
pkgver=0.10.0
pkgrel=1
epoch=
pkgdesc="Constraint Programming and Modeling in Python"
arch=('any')
url="https://cpmpy.readthedocs.io/en/latest/"
git_url="https://github.com/CPMpy/cpmpy/"
license=('GPL')
groups=()
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::$git_url/archive/v$pkgver.tar.gz")
noextract=()
sha256sums=('84e18ce7e9cdf045dd84332f79721f41e767aaf8e482ce9280f7cf3a60e388ab')
validpgpkeys=()

build() {
	cd "$srcdir/${pkgname#python-}-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/${pkgname#python-}-$pkgver"
    	python -m installer -d "$pkgdir" dist/*.whl
}
