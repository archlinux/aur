# Maintainer: SZanko szanko at protonmail dot com

pkgname=python-fsutil
pkgver=0.4.0
pkgrel=1
pkgdesc="file-system utilities for lazy devs."
arch=('any')
url="https://github.com/fabiocaccamo/python-fsutil"
license=('MIT')
depends=(
	'python'
	'python-requests'
)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('ee8d3e55ea0260e9def4a0263302b5c0796fd6a87828ec0775ed96b3c676f776')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
