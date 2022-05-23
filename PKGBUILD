# Maintainer: SZanko szanko at protonmail dot com

pkgname=python-fsutil
pkgver=0.6.1
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
	'python-build'
)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('fa5ca88b9064af7142e2be67ff4b5e93a3de791bb6feae1e4b57b8484e54d8b7')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python3 -m build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
