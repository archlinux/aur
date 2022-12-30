# Maintainer: SZanko szanko at protonmail dot com

pkgname=python-fsutil
pkgver=0.8.0
pkgrel=1
pkgdesc="file-system utilities for lazy devs."
arch=('any')
url="https://github.com/fabiocaccamo/python-fsutil"
license=('MIT')
depends=(
	'python'
)
makedepends=(
	'python-build'
	'python-installer'
)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('efc3421c7ca84aa1a2035e421174b2cfdf073bf01633b723980f9115b0e3b806')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python3 -m build --wheel --skip-dependency-check 
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python3 -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
