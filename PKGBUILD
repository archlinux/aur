# Maintainer: SZanko szanko at protonmail dot com

pkgname=python-fsutil
pkgver=0.7.0
pkgrel=1
pkgdesc="file-system utilities for lazy devs."
arch=('any')
url="https://github.com/fabiocaccamo/python-fsutil"
license=('MIT')
depends=(
	'python'
	'python-requests'
)
makedepends=(
	'python-build'
	'python-installer'
)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('f7b34e8a1e241457fddcc75c7bfa497cd909b6931360816e8c12fba5a943b112')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python3 -m build --wheel --skip-dependency-check 
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python3 -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
