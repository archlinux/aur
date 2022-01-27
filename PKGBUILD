# Maintainer: SZanko szanko at protonmail dot com

pkgname=python-fsutil
pkgver=0.6.0
pkgrel=2
pkgdesc="file-system utilities for lazy devs."
arch=('any')
url="https://github.com/fabiocaccamo/python-fsutil"
license=('MIT')
depends=(
	'python'
	'python-requests'
)
makedepends=(
	'python-setuptools'
)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('f338558b1b55d1e5386cbd2c03ac2be026e65e047a1c0c2d063df321579b4523')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
