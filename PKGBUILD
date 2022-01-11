# Maintainer: SZanko szanko at protonmail dot com

pkgname=python-fsutil
pkgver=0.5.0
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
sha256sums=('d18dee00de14cc813777042d271ebd8cdb0d39ab973f29639ecad38eb1bd21be')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
