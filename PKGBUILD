# Maintainer: naether.markus[at]gmail.com

pkgname=python-sqltrie
pkgver=0.11.2
pkgrel=1
pkgdesc="SQL-based prefix tree implementation inspired by pygtrie and python-diskcache."
arch=('any')
url="https://github.com/iterative/sqltrie"
license=('Apache-2.0')
depends=(
	'python'
)
makedepends=(
	'python-build'
	'python-installer'
)
source=("sqltrie-${pkgver}::git+${url}.git#tag=${pkgver}")
sha256sums=(
	'SKIP'
)

build() {
	cd "${srcdir}/sqltrie-${pkgver}"
	python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
    cd "$srcdir/sqltrie-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/sqltrie"
}
