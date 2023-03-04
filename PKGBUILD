# Maintainer: Markus Richter <mqus at disroot dot org>
_pkgname=pm4py-core
pkgname=python-pm4py
pkgver=2.5.2
pkgrel=2
pkgdesc="State-of-the-art-process mining in Python"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/pm4py/pm4py-core"
license=('GPL3')
groups=()
depends=(
	'python'
	'python-cvxopt'
	'python-deprecation'
	'python-graphviz'
	'python-intervaltree'
	'python-lxml'
	'python-matplotlib'
	'python-networkx'
	'python-numpy'
	'python-pandas'
	'python-pyarrow'
	'python-pydotplus'
	'python-pyemd'
	'python-pytz'
	'python-pyvis'
	'python-scipy'
	'python-stringdist'
	'python-tqdm'
	'glpk'
	)
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov')
conflicts=("$pkgname-git")
replaces=()
backup=()
options=()
install=
_archive="$_pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
noextract=()
sha512sums=('744f3700db7fdd2dc347ed8325226ff1d772f76a889a587551cdaeba719a0561778fad339b40caf1c5070551e7b52eb463d1e0c7d1aac117a23081f2b9f77350')

build() {
	cd "$srcdir/${_archive}"
	python setup.py build
}

check() {
	cd "$srcdir/${_archive}/tests"
	python execute_tests.py
}

package() {
	cd "$srcdir/${_archive}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
