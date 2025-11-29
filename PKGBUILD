# Contributor: SZanko szanko at protonmail dot com

pkgname=python-fsutil
pkgver=0.15.0
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
	'python-setuptools'
)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('3a4a430996e2c385963cd4c9fb7338d0cbeac0a74b44e95bf31ef5adffd87017')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
